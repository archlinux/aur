# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=fontship-git
pkgver=0.0.1.r15.g3990d07
pkgrel=1
pkgdesc='A font development toolkit and collaborative work flow'
arch=('any')
url="https://github.com/theleagueof/${pkgname%-git}"
license=('AGPL3')
depends=('entr'
         'font-v'
         'git'
         'libarchive'
         'make'
         'python'
         'python-click'
         'python-fontmake'
         'python-fonttools'
         'python-ufonormalizer'
         'zsh')
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --abbrev=7 --match 'v*' --tags |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    ./bootstrap.sh
}

build() {
    cd "${pkgname%-git}"
    ./configure --prefix="/usr"
    make
}

package() {
    cd "${pkgname%-git}"
    make DESTDIR="$pkgdir" install
}
