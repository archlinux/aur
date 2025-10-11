# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=emojimart
pkgname=$_pkgname-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Modern emoji picker popup for desktop (binary release)"
url="https://github.com/vemonet/EmojiMart"
license=('MIT')
arch=('x86_64')
depends=('gtk3' 'webkit2gtk')
optdepends=('xdotool: automatically paste to your currently focused app (X11)'
            'ydotool: automatically paste to your currently focused app (Wayland)')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$url/releases/download/v$pkgver/EmojiMart_${pkgver}_amd64.deb"
        "$url/raw/v0.3.0/LICENSE.txt")
sha256sums=('572a48c86a48ee8e56fc64202b5c9df98982429368eecb2cc3359bc3bddb4612'
            '9684d0ee41e202b6f39948837f049307287571c4413003509d9cdf7b635e6db9')

prepare() {
  tar -xf data.tar.gz
}

package() {
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/doc/$_pkgname"
  cd usr
  for i in 32x32 128x128 256x256@2; do
    install -Dm644 share/icons/hicolor/$i/apps/emoji-mart-app.png "$pkgdir/usr/share/icons/hicolor/$i/apps/$_pkgname.png"
  done
  install -Dm644 share/applications/EmojiMart.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm755 bin/emoji-mart-app -t "$pkgdir/usr/bin"
  ln -s emoji-mart-app "$pkgdir/usr/bin/$_pkgname"
}
