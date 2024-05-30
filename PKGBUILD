# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=kitch-bin
pkgver=26.1.3
pkgrel=2
pkgdesc="The itch.io desktop app (beta channel; binary release)"
url="https://itchio.itch.io/kitch"
license=('MIT')
arch=('x86_64')
provides=("kitch")
conflicts=("kitch" "kitch-setup")
depends=('alsa-lib' 'at-spi2-core' 'bash' 'cairo' 'dbus' 'expat' 'gcc-libs'
         'glib2' 'gtk3' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrand'r 'mesa'
         'nspr' 'nss' 'pango')
optdepends=('firejail: sandbox preference')
source=("kitch-linux-amd64-$pkgver.zip::https://broth.itch.ovh/kitch/linux-amd64/$pkgver/archive/default"
        "https://github.com/itchio/itch/raw/master/LICENSE")
sha256sums=('5a4079ddce5770dcddc947e64fe28e01de253d45b7a7ba24d4dc2aa48fb59a10'
            'SKIP')

prepare() {
# Create a shortcut
  echo -e "[Desktop Entry]\n\
Name=kitch\n\
Comment=The itch.io desktop app (beta channel)\n\
Exec=/opt/kitch/kitch %U\n\
Icon=kitch\n\
Terminal=false\n\
Type=Application\n\
StartupWMClass=kitch\n\
Categories=Game;
MimeType=x-scheme-handler/kitchio;x-scheme-handler/kitch;" > kitch.desktop
}

package() {
# Create directories
  mkdir -p "$pkgdir/opt/kitch" "$pkgdir/usr/bin"
# Install
  install -Dm644 kitch.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/kitch"
  install -Dm644 resources/app/src/static/images/tray/kitch.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 resources/app/src/static/images/window/kitch/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/kitch.png"
  install -Dm644 resources/app/src/static/images/window/kitch/icon-32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/kitch.png"
  rm LICENSE kitch.desktop kitch-linux-amd64-$pkgver.zip
  mv * "$pkgdir/opt/kitch"
  ln -s /opt/kitch/kitch "$pkgdir/usr/bin"
}
