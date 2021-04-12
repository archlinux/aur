pkgname=citymapper-nativefier
pkgver=0.0.1
pkgrel=1


pkgdesc="Electron wrapper for Citymapper built with Nativefier"
arch=(x86_64)
license=(MIT)
url=https://citymapper.com
source=($pkgname.png
        $pkgname.desktop)
makedepends=(nodejs nodejs-nativefier npm)
sha256sums=('1159331fe36af966c4295e93f442b056e03b187727aedf510696019d50de4517'
            'a604da790ad056d939606ee3a32cf46054b7455fd1701db11be9cc1c142fef63')

_instname=citymapper

build() {
    nativefier "https://citymapper.com" \
      --icon $pkgname.png \
      --maximize \
      --name $_instname \
      --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/87.0" \
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

