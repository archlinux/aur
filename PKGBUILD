# Maintainer: Kristian Gunstone <kristian.gunstone.butnotthispart@pean.northis.org>
pkgname=netris-git
pkgver=0.56g_1 # Is automatically updated by pkgver() below
pkgrel=1
pkgdesc="Mark H. Weaver's Netris - A networked terminal version of Tetris. This is my fork, which itself is based on Nathan Aclander's fork."
arch=('i686' 'x86_64')
url="https://github.com/gammy/netris.git"
license=('GPL2')
depends=()
makedepends=('git')
provides=()
conflicts=('netris') # Doesn't actually exist at the time of writing
                     # (the original site - netris.org - is dead)
sha1sums+=('SKIP')
md5sums=('SKIP')
source=("${pkgname}::git+https://github.com/gammy/netris.git")

pkgver() {
    cd "${pkgname}"
    git fetch > /dev/null 2>&1 \
        && git describe --tags > /dev/null 2>&1 \
        && git describe --tags | cut -d '-' -f -2 > VERSION
    head -n1 VERSION | tr '-' '_'
}

build() {
    cd "$pkgname"
    ./Configure
    make
}

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/man/man6/"
    cp -v "${pkgname}/netris"       "${pkgdir}/usr/bin/netris"
    cp -v "${pkgname}/sr"           "${pkgdir}/usr/bin/netris-sr"
    cp -v "${pkgname}/netris.6.man" "${pkgdir}/usr/share/man/man6/"
}
