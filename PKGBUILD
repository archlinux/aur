# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2027

pkgname=maya-bifrost
pkgver=3.0.0.0
pkgrel=2
pkgdesc='Autodesk Maya Bifrost Plugin'
arch=('x86_64')
url='https://area.autodesk.com/bifrost/'
license=('custom')
depends=("maya>=${_mayaver}" 'maya<2028.0')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://Bifrost${_mayaver}-${pkgver}-${pkgver}-1.x86_64.rpm")
b2sums=('4f3833af25ebb483892a301096708e93657a3d250acbe7aeef18585d1f1e4d67d2c1674e06400fdf5fb631fbda8e09f4101a1948d10712c768ef145acbf8f93a')

options=(!strip)

prepare() {
    rm --force ./*.rpm
    sed -i "s|<BIFROST_DIR>|/usr/autodesk/maya$_mayaver/plug-ins/bifrost|g" usr/autodesk/modules/maya/$_mayaver/bifrost.mod
    sed -i "s|<PLUGIN_DIR>|/usr/autodesk/maya$_mayaver/plug-ins/vnn|g" usr/autodesk/modules/maya/$_mayaver/vnn.mod
}

package() {
    mkdir -p "$pkgdir/usr/autodesk/maya$_mayaver/"{modules,plug-ins}
    mv usr/autodesk/modules/maya/$_mayaver/*.mod "$pkgdir/usr/autodesk/maya$_mayaver/modules/"
    mv usr/autodesk/bifrost/maya$_mayaver/$pkgver/* "$pkgdir/usr/autodesk/maya$_mayaver/plug-ins/"
    install -Dm644 "$srcdir/EULA/English.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
