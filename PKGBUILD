# Maintainer: Leo_L <Leo dot Lahtinen at protonmail dot com>

pkgname=google-drive-nativefier
pkgver=1
pkgrel=1
pkgdesc="Electron wrapper for the Google Drive web application"
arch=(x86_64)
license=(MIT)
url=https://drive.google.com
source=($pkgname.png
        $pkgname.desktop)
makedepends=(nodejs nodejs-nativefier npm)
sha256sums=('66bdce2fa39ca142d63f322cf9b0dc93873269930652a30037c1882fe99e02fd'
            '065bcc5f707f4e1f63d7b024c0c8113b1707375c7dc6e2a6239edf5a110411c1')

_instname=google-drive

build() {
    nativefier "https://drive.google.com/" \
      --icon $pkgname.png \
      --maximize \
      --internal-urls "(accounts|drive)\.google" \
      --name "Google Drive"
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$_instname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}

