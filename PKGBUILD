# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=fontship-git
pkgver=0.0.0.r0.g4cbb5ee
pkgrel=1
pkgdesc='A font development toolkit and collaborative work flow'
arch=('any')
url="https://github.com/theleagueof/${pkgname%-git}"
license=('AGPL3')
depends=('font-v'
         'git'
         'make'
         'python'
         'python-ufonormalizer'
         'python-fontmake'
         'python-fonttools'
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
