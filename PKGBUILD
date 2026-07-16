# Maintainer: reisub <re1sub@proton.me>

pkgname=firestudio-bin
pkgver=1.9.1
pkgrel=1
pkgdesc='A powerful open-source GUI client for Firebase Firestore'
arch=(x86_64)
url='https://github.com/Flowdesktech/firestudio'
license=(MIT)
depends=(electron)
provides=(firestudio)
conflicts=(firestudio)
source=("$url/releases/download/v$pkgver/Firestudio-$pkgver-Linux-x64.tar.gz")
sha256sums=('a30f5664267bd08bd21e6e0cfe0c37d2c7d3d1baecdea03d1ed1b6ed95fb6dd8')

package() {
  cd "$srcdir/Firestudio-$pkgver-Linux-x64"

  install -dm755 "$pkgdir/opt/firestudio"
  cp -r . "$pkgdir/opt/firestudio/"

  install -dm755 "$pkgdir/usr/bin"
  ln -sf /opt/firestudio/firestudio "$pkgdir/usr/bin/firestudio"

  install -dm755 "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/firestudio.desktop" << EOF
[Desktop Entry]
Name=Firestudio
Comment=$pkgdesc
Exec=/opt/firestudio/firestudio
Icon=firestudio
Terminal=false
Type=Application
Categories=Development;Utility;
StartupWMClass=firestudio
EOF

  install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -m644 resources/assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/firestudio.svg"
}
