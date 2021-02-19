pkgname=google-calendar-nativefier-dark
pkgver=0.9.2
pkgrel=1
# Dark theme by pyxelr (https://userstyles.org/styles/143026/dark-google-calendar-2020)

pkgdesc="Electron wrapper for the Google Calendar web application with dark theme (by pyxelr)"
arch=(x86_64)
license=(MIT)
url=https://calendar.google.com
source=($pkgname.png
        $pkgname.desktop
        $pkgname.js)
makedepends=(nodejs nodejs-nativefier npm)
sha256sums=('97e7237e745704869306cc96856e320d673140ff6f91f9ed61b592e7afc0f176'
            '28a8e5d48c8cb41998b47ebfde05ad8c765bd15cc5e66cf036e3419547562612'
            'bd1a3d162153596ac3bda552de689d0bde95f038fcaf4f0d1143b2bdf16d03b2')

_instname=google-calendar-dark

build() {
    nativefier "https://calendar.google.com/" \
      --icon $pkgname.png \
      --maximize \
      --name $_instname \
      --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0" \
      --internal-urls "(.*?calendar\.google\.com.*?|.*?accounts\.google\.com.*?)" \
      --single-instance \
      --inject $pkgname.js
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$_instname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}

