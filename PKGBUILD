# Maintainer: Harsh Barsaiyan <hbarsaiyan at gmail dot com>

pkgname=('gravit-designer-electron')
_pkgname=('gravit-designer')
pkgver=2020_1.3.4
pkgrel=1
pkgdesc="Electron wrapper for the Gravit Designer web application"
arch=(any)
license=(custom)
url="https://designer.io/"
source=($_pkgname.png
        $_pkgname.desktop
        LICENSE)
        
makedepends=(nodejs nodejs-nativefier npm unzip)
sha256sums=('80f947f51165c9764ec3ac168df64178a68c26c49d96ae1a970930146aee3cfe'
            'c7f033c88085631d92e722ff1a54a9d65173a25869e6ec4938dd6e90d2c0ed2e'
            '92b40d4d5f6eed16d088ae3c9427e37515cd28626cd79fa15efdc94fc8987a94')

_instname="GravitDesigner"

build() {
    nativefier "https://designer.gravit.io/" \
      --icon $_pkgname.png \
      --maximize \
      --name $_instname \
      --internal-urls "(.*?designer\.gravit\.io.*?|.*?accounts\.google\.com.*?|.*?cloud\.gravit\.io.*?)" \
      --single-instance
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $_pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop
    cp -rL $_instname-linux-* "$pkgdir"/opt/$_pkgname
    ln -sf /opt/$_pkgname/$_instname "$pkgdir"/usr/bin/$_pkgname
    ln -sf /opt/$_pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
    chmod 666 "$pkgdir"/opt/$_pkgname/resources/app/nativefier.json
    install -D LICENSE "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE
}
