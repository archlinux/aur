# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=emoji-keyboard
pkgname=$_pkgname-bin
pkgver=4.0.0
pkgrel=2
pkgdesc='Virtual keyboard like emoji palette (binary release)'
url="https://github.com/OzymandiasTheGreat/emoji-keyboard"
arch=('x86_64')
license=('MIT')
depends=('libayatana-appindicator' 'webkit2gtk')
source=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_amd64.deb"
        "$url/raw/v$pkgver/LICENSE")
sha256sums=('bfc9c56bc3355dd5d2b5f44451eea8ec6b41f7c8afbe6370b38f18a80b083873'
            'SKIP')

prepare() {
  tar -xf data.tar.gz
}

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  cd usr
  install -Dm644 share/applications/$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  for i in 32x32 128x128 256x256@2; do
    install -Dm644 share/icons/hicolor/$i/apps/$_pkgname.png -t "$pkgdir/usr/share/icons/hicolor/$i/apps"
  done
  install -Dm755 bin/$_pkgname -t "$pkgdir/usr/bin"
}
