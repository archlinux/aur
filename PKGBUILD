# Maintainer: Yacob Zitouni <yacobzitouni at gmail dot com>

pkgname=the-sims-online-data
pkgver=1.1097.1.0
pkgrel=1
pkgdesc="The Sims Online game data. Patched with TSO-Version-Patcher to get the N&I version used by FreeSo"
license=('custom:eula')
groups=('games')
arch=('x86_64' 'i686')
makedepends=('cabextract' 'tso-version-patcher')
source=("http://archive.org/download/Fileplanet_dd_042006/Fileplanet_dd_042006.tar/042006/TSO_Installer_v1.1239.1.0.zip")
sha256sums=('3b10be6fb736116ae32051e9ad7a506b224b5ef5d98139f0312eb2e6dcadcce4')

prepare() {
    cd "TSO_Installer_v1.1239.1.0"
    # extract data file
    cabextract -d ../tso-data Data1.cab
    # patch to get right version
    tso-version-patcher /usr/share/tso-version-patcher/1239toNI.tsop ../tso-data
}

package() {
    cd "tso-data"

    install -d "$pkgdir"/opt/the-sims-online-data
    cp -r {TSOClient,TSOPatch,README.txt} "$pkgdir"/opt/the-sims-online-data/
    
    cd "../TSO_Installer_v1.1239.1.0"

    install -m 644 Setup/License.txt "$pkgdir"/opt/the-sims-online-data
}
