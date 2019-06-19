pkgname=google-calendar-nativefier
pkgver=0.6
pkgrel=1
pkgdesc="Electron wrapper for the Google Calendar web application"
arch=(x86_64)
license=(MIT)
url=https://calendar.google.com
source=($pkgname.png
        $pkgname.desktop)
makedepends=(nodejs nodejs-nativefier npm)
sha256sums=('f1bb8a24f4d009a4ae31a22bedcc9c54224542288a33cd301fa1d1348cbbac09'
            '05512fbf7028c19cb766ce7c3dff05975670cc2a4bc187928504723b3fee83d9')

_instname=google-calendar

build() {
    nativefier "https://calendar.google.com/" \
      --icon $pkgname.png \
      --maximize \
      --internal-urls "(accounts|calendar)\.google" \
      --name "Google Calendar"
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$_instname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}

