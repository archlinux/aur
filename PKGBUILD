# Maintainer: Yacob Zitouni <yacobzitouni at gmail dot com>

pkgname=the-sims-online-data
pkgver=1.1097.1.0
pkgrel=1
pkgdesc="The Sims Online game data. Patched with TSO-Version-Patcher to get the N&I version used by FreeSo"
license=('custom:eula')
groups=('games')
arch=('any')
makedepends=('cabextract' 'tso-version-patcher')
source=("https://freemyland.com/wp-content/uploads/downloads/misc/tso.zip")
sha256sums=('b161ea59d159fecac0dc6ed1f6d3bed2c183394a045f6af24753a248beb2e439')

prepare() {
    cd "tso/The Sims Online Setup Files"
    # extract data file
    cabextract -d ../../tso-data Data1.cab
    # patch to get right version
    tso-version-patcher /usr/share/tso-version-patcher/1239toNI.tsop ../../tso-data
}

package() {
    cd "tso-data"

    install -d "$pkgdir"/opt/the-sims-online-data
    cp -r {TSOClient,TSOPatch,README.txt} "$pkgdir"/opt/the-sims-online-data/
    
    cd "../tso/The Sims Online Setup Files"

    install -m 644 Setup/License.txt "$pkgdir"/opt/the-sims-online-data
}
