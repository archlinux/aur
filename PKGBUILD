pkgname=google-keep-nativefier
pkgver=0.4.1
pkgrel=1
pkgdesc="Electron wrapper for the Google Keep web application"
arch=(x86_64)
license=(MIT)
url=https://keep.google.com
source=($pkgname.png
        $pkgname.desktop)
makedepends=(nodejs nodejs-nativefier npm)
sha256sums=('30bf408abb4d6639864c05a6c829fba7624bbec254eeab52a72ce0d8b91fbb1f'
            '2ef4f9ffb7aa8405083f50413bd4f16bd3856a6146887f68c66589331d4f8193')

_instname=google-keep
build() {
    nativefier "https://keep.google.com/" \
      --icon $pkgname.png \
      --maximize \
      --name $_instname \
      --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0" \
      --internal-urls "(.*?keep\.google\.com.*?|.*?accounts\.google\.com.*?)" \
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

