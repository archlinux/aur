# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=kitch
pkgname=kitch-bin
pkgdesc="The development branch of the itchio app (binary release)"
pkgver=26.1.2
pkgrel=4
arch=('x86_64')
url="https://itchio.itch.io/kitch"
license=('MIT')
provides=("kitch")
conflicts=("kitch" "kitch-setup" "itch" "itch-setup")
optdepends=('firejail: itch.io sandbox preference')
source=("kitch-$pkgver-linux-amd64.zip::https://broth.itch.ovh/kitch/linux-amd64/$pkgver/archive/default"
        "LICENSE::https://github.com/itchio/itch/raw/master/LICENSE")
sha256sums=('e962fb202d4dbf4c287e634bef6c5c191b884544cf24e025675df450d9dc2bda'
            'SKIP')

prepare() {
# Create a shortcut
  echo -e "[Desktop Entry]\n\
Name=kitch\n\
Exec=/opt/kitch/kitch %U\n\
Terminal=false\n\
Type=Application\n\
Icon=kitch\n\
StartupWMClass=kitch\n\
Comment=The development branch of the itchio app\n\
Categories=Game;" > desktop
  mv desktop kitch.desktop
}

package() {
# Create folders
  mkdir -p "$pkgdir/opt/kitch" "$pkgdir/usr/bin"
# Install
  install -Dm644 kitch.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/kitch"
  install -Dm644 resources/app/src/static/images/tray/kitch.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 resources/app/src/static/images/window/kitch/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/kitch.png"
  install -Dm644 resources/app/src/static/images/window/kitch/icon-32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/kitch.png"
  rm LICENSE kitch.desktop kitch-$pkgver-linux-amd64.zip
  mv * "$pkgdir/opt/kitch"
  ln -s /opt/kitch/kitch "$pkgdir/usr/bin"
}
