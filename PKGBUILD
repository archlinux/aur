# Maintainer: KometTeam

pkgname=komet
pkgver=0.4.1
pkgrel=2
pkgdesc="Komet — Multifunctional MAX client (Flutter desktop)"
arch=('x86_64')
url="https://github.com/KometTeam/Komet"
license=('GPL3')
depends=('gtk3' 'glib2' 'libsecret' 'libepoxy' 'at-spi2-core')
makedepends=('flutter' 'git')
options=(!debug) # Отключаем debug пакет, чтобы не было конфликтов с flutter-debug
source=("git+https://github.com/KometTeam/Komet.git#commit=3272e81c6360e064f71a6d39f2064a96a894a727")
sha256sums=('SKIP')

build() {
  cd "$srcdir/Komet"

  flutter build linux --release
}

package() {
  cd "$srcdir/Komet"

  install -d "$pkgdir/opt/komet"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps"

  cp -r build/linux/x64/release/bundle/* "$pkgdir/opt/komet/"


  ln -s /opt/komet/Komet "$pkgdir/usr/bin/komet"


  echo "[Desktop Entry]
Name=Komet
Comment=Multifunctional MAX client
Exec=/usr/bin/komet
Icon=komet
Type=Application
Categories=Network;Chat;
Terminal=false" > "$pkgdir/usr/share/applications/komet.desktop"

  if [ -f "assets/icon/komet_512.png" ]; then
    install -m644 assets/icon/komet_512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/komet.png"
  fi
}
