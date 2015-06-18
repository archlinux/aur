# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
# 

pkgname='sfnettest'
pkgdesc="A suite of tools developed by Solarflare for probing network performance."
pkgver='1.5.0'
pkgrel=1
arch=('x86_64')
url='http://www.openonload.org/'
license=('GPL2')
depends=('openonload')
#makedepends=('')
options=('!libtool' '!strip' '!makeflags' '!buildflags' 'staticlibs')
source=("http://www.openonload.org/download/${pkgname}/${pkgname}-${pkgver}.tgz")
sha512sums=('27b71cf706ab2f84d115f41e76e05bb0057d48042ee145bca280c58b4d5c3cfb810d3e0d126d8573b6907c2dbf918fe013241cb87172a1f4e0470bdfa5f5433a')
#install=

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/src"
    make clean
    make all
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    install -dm755 "${pkgdir}/usr/share/licenses/sfnettest"
    install -m644 LICENSE "${pkgdir}/usr/share/licenses/sfnettest"
    install -dm755 "${pkgdir}/usr/share/doc/sfnettest"
    install -m644 README README.sfnt-pingpong README.sfnt-stream ChangeLog \
            "${pkgdir}/usr/share/doc/sfnettest"
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 src/sfnt-pingpong src/sfnt-stream "${pkgdir}/usr/bin"
}
