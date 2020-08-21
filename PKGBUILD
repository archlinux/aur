pkgname=realtimetrains-nativefier
pkgver=0.0.1
pkgrel=1


pkgdesc="Electron wrapper for the website realtimetrains.co.uk built with Nativefier"
arch=(x86_64)
license=(MIT)
url=https://www.realtimetrains.co.uk
source=($pkgname.png
        $pkgname.desktop)
makedepends=(nodejs nodejs-nativefier npm)
sha256sums=('e514c51e5823536e3c1e992d0adfea94d6bd8ef7b2460c153fecd9c879ab303d'
            '37a1eb39c01579a72e5da4837abb44f7dd0e6b660b89dc66cc752e21c34cebd8')

_instname=realtimetrains

build() {
    nativefier "https://www.realtimetrains.co.uk" \
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

