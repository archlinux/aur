# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Łukasz Mariański <lmarianski at protonmail dot com>

pkgname=itch-bin
pkgver=25.6.2
pkgrel=1
pkgdesc="The itch.io desktop app (binary release)"
url="https://itchio.itch.io/itch"
license=('MIT')
arch=('x86_64')
provides=("itch")
conflicts=("itch" "itch-setup")
depends=('alsa-lib' 'at-spi2-core' 'bash' 'cairo' 'dbus' 'expat' 'gcc-libs'
         'gdk-pixbuf2' 'glib2' 'gtk3' 'libcups' 'libdrm' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
         'libxrandr' 'mesa' 'nspr' 'nss' 'pango')
optdepends=('firejail: sandbox preference')
source=("itch-linux-amd64-$pkgver.zip::https://broth.itch.ovh/itch/linux-amd64/$pkgver/archive/default"
        "LICENSE::https://github.com/itchio/itch/raw/master/LICENSE")
sha256sums=('46b16cc160a8e9720e190be14d91c6b290f3cce0fffadfffd20323296c9c09de'
            'SKIP')

prepare() {
# Create a shortcut
  echo -e "[Desktop Entry]\n\
Name=itch\n\
Comment=The itch.io desktop app\n\
Exec=/opt/itch/itch %U\n\
Icon=itch\n\
Terminal=false\n\
Type=Application\n\
StartupWMClass=itch\n\
Categories=Game;
MimeType=x-scheme-handler/itchio;x-scheme-handler/itch;" > itch.desktop
}

package() {
# Create directories
  mkdir -p "$pkgdir/opt/itch" "$pkgdir/usr/bin"
# Install
  install -Dm644 itch.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/itch"
  install -Dm644 resources/app/src/static/images/tray/itch.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 resources/app/src/static/images/window/itch/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/itch.png"
  install -Dm644 resources/app/src/static/images/window/itch/icon-32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/itch.png"
  rm LICENSE itch.desktop itch-linux-amd64-$pkgver.zip
  mv * "$pkgdir/opt/itch"
  ln -s /opt/itch/itch "$pkgdir/usr/bin"
}
