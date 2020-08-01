# Maintainer: Leo_L <Leo dot Lahtinen at protonmail dot com>

pkgname=google-drive-nativefier
pkgver=1
pkgrel=2
pkgdesc="Electron wrapper for the Google Drive web application"
arch=(x86_64)
license=(MIT)
url=https://drive.google.com
source=($pkgname.png
        $pkgname.desktop)
makedepends=(nodejs nodejs-nativefier npm unzip)
sha256sums=('66bdce2fa39ca142d63f322cf9b0dc93873269930652a30037c1882fe99e02fd'
            '065bcc5f707f4e1f63d7b024c0c8113b1707375c7dc6e2a6239edf5a110411c1')

_instname=google-drive
_name1=GoogleDrive-linux-x64
_executablename=GoogleDrive

build() {
    nativefier "https://drive.google.com/" \
      --icon $pkgname.png \
      --maximize \
      --internal-urls "(accounts|drive)\.google" \
      --name "Google Drive" \
      --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0" \
      --internal-urls "(.*?docs\.google\.com.*?|.*?accounts\.google\.com.*?)" \
      --single-instance 
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_name1 "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_executablename "$pkgdir"/usr/bin/$_instname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$_instname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}

