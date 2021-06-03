# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
_pkgname='susbernate'
pkgname="${_pkgname}-git"
pkgver=r3.639961e
pkgrel=1
pkgdesc='Script to suspend the system, then hibernate after a while'
arch=('x86_64')
url='https://github.com/soystemd/susbernate'
license=('GPL')
optdepends=('xprintidle')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm755 susbernate "${pkgdir}/usr/bin/susbernate"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
