# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm-git
pkgver=0.0.1.r50.ge3052ec
pkgrel=1
depends=('pam')
makedepends=('git' 'make' 'gcc')
pkgdesc="A fully colorful cutomizable TUI display manager made in C. (last git commit)"
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
    install -Dm755 lidm "${pkgdir}/usr/bin/lidm"
    install -Dm644 themes/default.ini "${pkgdir}/etc/lidm.ini"
}
