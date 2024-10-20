# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=emojimart
pkgname=$_pkgname-bin
pkgver=0.3.0
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
sha256sums=('4cd9a87b9e1dde98b5b39cf41f2d157eb84a509720177d80ffc6fafce6df486e'
            '9684d0ee41e202b6f39948837f049307287571c4413003509d9cdf7b635e6db9')

prepare() {
# Extract the files
  tar -xf data.tar.gz
# Edit the shortcut
  cd usr/share/applications
  sed -i -E "s|Comment=Emoji picker for desktop. Built with the Emoji Mart web component, and packaged as a tauri app.|Comment=Emoji picker|g" EmojiMart.desktop
  sed -i -E "s|Exec=emoji-mart-app|Exec=$_pkgname|g" EmojiMart.desktop
  sed -i -E "s|Icon=emoji-mart-app|Icon=$_pkgname|g" EmojiMart.desktop
}

package() {
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/doc/$_pkgname"
  cd usr
  for i in 32x32 128x128 256x256@2; do
    install -Dm644 share/icons/hicolor/$i/apps/emoji-mart-app.png "$pkgdir/usr/share/icons/hicolor/$i/apps/$_pkgname.png"
  done
  install -Dm644 share/applications/EmojiMart.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm755 bin/emoji-mart-app "$pkgdir/usr/bin/$_pkgname"
}
