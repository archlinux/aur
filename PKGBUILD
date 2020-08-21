pkgname=traksy-nativefier
pkgver=0.0.1
pkgrel=1


pkgdesc="Electron wrapper for the website traksy.uk built with Nativefier"
arch=(x86_64)
license=(MIT)
url=https://traksy.uk
source=($pkgname.png
        $pkgname.desktop)
makedepends=(nodejs nodejs-nativefier npm)
sha256sums=('80d2d640bdf3aa66ea4d308f78eb529f2fc8d12ddc031540d8482b764f671fb6'
            'cdbf312e4c1b3d3d6a00e82adb200b3c43a17fa2ba192a43d372829735072250')

_instname=traksy

build() {
    nativefier "https://traksy.uk" \
      --icon $pkgname.png \
      --maximize \
      --name $_instname \
      --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0" \
      --single-instance
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$_instname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}

