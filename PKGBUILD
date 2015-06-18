# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
# 

pkgname='sysjitter'
pkgdesc="A tool that measures the jitter experienced by user-level threads running on each CPU core of a computer."
pkgver='1.1'
pkgrel=1
arch=('x86_64')
url='http://www.openonload.org/'
license=('GPL3')
#depends=('')
#makedepends=('')
options=('!libtool' '!strip' '!makeflags' '!buildflags' 'staticlibs')
source=("http://www.openonload.org/download/${pkgname}/${pkgname}-${pkgver}.tgz")
sha512sums=('0b1085fcf22611e1ba4a2ff355d353d4a45a44e88b650c718f6888678fd298965470134c1f49a087aea25f6207aaf9e071e46210dc91165bcf238e504faf7860')
#install=

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    INCLUDE="" make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    if [[ -e gpl.txt ]]; then
        mv gpl.txt LICENSE
    fi
    if diff LICENSE /usr/share/licenses/common/GPL3/license.txt; then
        ln -s ../common/GPL3/license.txt \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    else
        install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
    fi
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -m644 README \
            "${pkgdir}/usr/share/doc/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 sysjitter "${pkgdir}/usr/bin"
}
