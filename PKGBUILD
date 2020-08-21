pkgname=brfares-nativefier
pkgver=0.0.1
pkgrel=1


pkgdesc="Electron wrapper for the website brfares.com built with Nativefier"
arch=(x86_64)
license=(MIT)
url=https://www.realtimetrains.co.uk
source=($pkgname.png
        $pkgname.desktop)
makedepends=(nodejs nodejs-nativefier npm)
sha256sums=('4a25333b2243f22f7f18fe3bb962e12e49b7aa3fbba7e829db5bde593b774921'
            '638737c8b0915e541dffe491efec14deac0718943fb1e31f0a9a79c604049195')

_instname=brfares

build() {
    nativefier "http://www.brfares.com" \
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

