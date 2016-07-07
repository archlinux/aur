# Maintainer: Laurent Tréguier <laurent@treguier.org>

pkgname=lzfse-git
pkgver=r20.4591228
pkgrel=3
pkgdesc="The LZFSE compression library and command line tool"
arch=("i686" "x86_64")
url="https://github.com/lzfse/lzfse"
license=("BSD")
depends=()
makedepends=("git")
optdepends=()
provides=("lzfse")
conficts=("lzfse")
source=("git+https://github.com/lzfse/lzfse") 
sha1sums=("SKIP")
_pkgname=lzfse

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_pkgname}
    make
}

package() {
    install -Dm755 ${srcdir}/${_pkgname}/build/bin/lzfse ${pkgdir}/usr/bin/lzfse
    install -d ${pkgdir}/usr/{include,lib}
    install -Dm644 ${srcdir}/${_pkgname}/src/lzfse.h ${pkgdir}/usr/include/lzfse.h
    install -Dm644 ${srcdir}/${_pkgname}/build/bin/liblzfse.a ${pkgdir}/usr/lib/
    install -d ${pkgdir}/usr/share/licenses/lzfse
    install -Dm644 ${srcdir}/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/lzfse/
}
