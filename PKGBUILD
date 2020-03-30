# Maintainer: Wainer Vandelli (<firstname>DOT<lastname>ATgmail.com)
pkgname=cernbox-nemo
pkgver=2.5.4_2719.1
pkgrel=1
pkgdesc="Nemo integration for CERN's CERNBox cloud service (based on ownCloud). Note: CERN IT does not provide official support for Arch Linux. Use at your own risk."
arch=('x86_64')
url="http://cernbox.web.cern.ch/"
license=('GPL')
depends=('cernbox' 'cernbox-overlay-icons')

_repo='https://cernbox.cern.ch/cernbox/doc/Linux/repo/Fedora_28/x86_64/'
source=(
    ${_repo}cernbox-client-nemo-${pkgver/_/-}.x86_64.rpm
)
md5sums=('931cfd8ad8dbd771f84822184f87a4e4')

package() {
    mkdir -p "${pkgdir}/usr"
    cp -dpr "${srcdir}/usr/share" "${pkgdir}/usr/"
    
    # Avoid interferences with the extensions installed by the owncloud client
    # Renaming the classes with a cernbox specific tag seems to suffice
    # To be followed up upstream
    sed -i -r 's:(^class )(.+\(.+Nemo.+\)\:)$:\1 Cernbox\2 :g' ${pkgdir}/usr/share/nemo-python/extensions/syncstate-cernbox.py
}
