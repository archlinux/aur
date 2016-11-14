# Maintainer: George Angelopoulos <george@usermod.net>

pkgname=collectl
pkgver=4.1.0
pkgrel=1
pkgdesc="A tool for viewing and gethering system performance metrics."
arch=('any')
url="http://collectl.sourceforge.net/"
license=('GPL2' 'custom:artistic')
depends=('perl')
backup=('etc/collectl.conf')
source=("http://sourceforge.net/projects/collectl/files/collectl/${pkgname}-${pkgver}/${pkgname}-${pkgver}.src.tar.gz")
md5sums=('5a80e8c19c04e433cfee8663bc5a777a')

package() {
	cd "${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ./INSTALL

    # systemd service file exists upstream but is not handled quite well by
    # the upstream INSTALL script. We install it here explicitly.
    install -D -m644 service/${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    # we don't have sysv init in arch
    rm -rf ${pkgdir}/etc/init.d

    # uninstall script is not needed since we're using a package manager :)
    rm -rf ${pkgdir}/usr/share/${pkgname}/UNINSTALL

    # collectl is licensed under the GPL2 and some version of the ARTISTIC
    # license. Since the version of the license from upstream doesn't
    # match with any of the common ones in Arch Linux, we'll copy the
    # artistic license here as custom.
    install -D -m644 ARTISTIC "${pkgdir}/usr/share/licenses/${pkgname}/ARTISTIC"
}
