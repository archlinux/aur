# shellcheck disable=SC2034,SC2148,SC2128,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm-git
pkgver=0.2.2.r0.gb22ae6b
pkgrel=1
depends=('pam')
makedepends=('git' 'make' 'gcc')
pkgdesc="A fully colorful customizable TUI display manager made in C. (last git commit)"
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL')
provides=('lidm')
conflicts=('lidm')
source=("lidm::git+https://github.com/javalsai/lidm")
sha256sums=('SKIP')

pkgver() {
    cd "lidm"
    git describe --long --abbrev=7 --tags | \
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "lidm"
    make CFLAGS="-O3"
}

package() {
    cd "lidm"
    make install DESTDIR="${pkgdir}"
}
