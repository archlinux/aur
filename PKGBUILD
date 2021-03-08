# Maintainer: Marat Talipov <t-marat@yandex.ru>
# Based on package "google-docs-nativefier"

pkgname=google-sheets-nativefier
pkgver=1
pkgrel=2
pkgdesc="Electron wrapper for the Google Sheets web application"
arch=(x86_64)
license=(MIT)
url=https://sheets.google.com
source=($pkgname.png
        $pkgname.desktop)
makedepends=(nodejs nodejs-nativefier npm unzip)
sha256sums=('0f785ccbb8d20eb21d81ac60cc85a0c84a84872dbaa9ca1563b3cbc093db399a'
            'fe9f908b7adb52f844762e2c3741802dc9b3bf13f9f059d9c819f562f988a624')

_instname=GoogleSheets

build() {
    nativefier "https://sheets.google.com/" \
      --icon $pkgname.png \
      --maximize \
      --name "$_instname" \
      --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0" \
      --internal-urls "(.*?sheets\.google\.com.*?|.*?accounts\.google\.com.*?)" \
      --single-instance \
      --electron-version 8.2.0
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$_instname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}