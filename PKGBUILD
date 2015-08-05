# Maintainer: Stephen Coetzee <sacoetzee@gmail.com>
pkgname=isohost-tools
_cmdname='isoho.st'
pkgver=0.4
pkgrel=1
pkgdesc="Tools provided for managing the Isoho.st Virtual Machine instances"
arch=(any)
license=('GPL3')
url="http://isoho.st/"
source=(http://isoho.st/download/${pkgname}-${pkgver}.tar.bz2)
depends=('virtviewer' 'perl')
md5sums=('ff06ecc81f7afbfc6f314b46074572ce')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"    

    # Executable
    install -D -m755 "${srcdir}/${pkgname}-${pkgver}/bin/${_cmdname}" "${pkgdir}/usr/bin/${_cmdname}"

    # Man Page 
    pod2man -c "General Commands Manual" -n ${_cmdname} -r "" \
         "${srcdir}/${pkgname}-${pkgver}/man/${_cmdname}.pod" \
         "${srcdir}/${pkgname}-${pkgver}/man/${_cmdname}.1"
    gzip "${srcdir}/${pkgname}-${pkgver}/man/${_cmdname}.1"
    install -D m644 "${srcdir}/${pkgname}-${pkgver}/man/${_cmdname}.1.gz" "${pkgdir}/usr/share/man/man1/${_cmdname}.1.gz" 

    # License
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}/GPL-3" "${pkgdir}/usr/share/licenses/isohost-tools/LICENSE"
}

# vim:set ts=4 sw=4 et:
