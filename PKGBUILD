#Maintainer: Arthorius <Arthcomicando@gmail.com>

pkgname=google-gmail-nativefier
pkgver=0.1
pkgrel=1
pkgdesc="Electron wrapper for the Google mail web application"
arch=(x86_64)
license=(MIT)
url="https://mail.google.com"
source=($pkgname.png
        $pkgname.desktop)
makedepends=(nodejs nodejs-nativefier npm unzip)
sha256sums=('fbe8559ad3b4307678250a671b8c259adf8ded119c8d133d1b706f0f4879a051'
            '8f02cb350bf14d7a58644106cdb32d963595d20c901b1537a02b9652acd65a42')

_instname=google-gmail

build() {
    nativefier "https://mail.google.com/" \
      --icon $pkgname.png \
      --maximize \
      --name $_instname \
      --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0" \
      --internal-urls "(.*?mail\.google\.com.*?|.*?accounts\.google\.com.*?)" \
      --single-instance \
      --tray \
      --electron-version 7.1.11
      
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$_instname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}
