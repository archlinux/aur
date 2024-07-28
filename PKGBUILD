# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm-git
pkgver=0.0.1.r0.gd6b165b
pkgrel=4
depends=('pam')
makedepends=('git' 'make')
pkgdesc="A fully colorful cutomizable TUI display manager made in C. (last git commit)"
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL')
provides=('lidm')
conflicts=('lidm')
source=("lidm::git+https://github.com/javalsai/lidm")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=7 --tags | \
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    make CFLAGS="-O3"
}

package() {
    cd "$pkgname"
    install -Dm755 lidm "${pkgdir}/usr/bin/lidm"
    install -Dm755 themes/default.ini "${pkgdir}/etc/lidm.ini"
}
