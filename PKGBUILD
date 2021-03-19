# Maintainer: edward-p <edward at edward-p dot xyz>
pkgname=projector-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='Common and client-related code for running Swing applications remotely.'
arch=('x86_64')
url='https://github.com/JetBrains/projector-client'
license=('MIT')
depends=('electron')
options=('!strip')
source_x86_64=(
  "$pkgname-$pkgver.zip::https://github.com/JetBrains/projector-client/releases/download/launcher-v${pkgver}/projector-linux-x64-launcher-v${pkgver}.zip"
)
source=(
  "projector.desktop"
  "projector.sh"
)
sha1sums=('9e5295435b2b5eef024a39a5a62fe1c3e81a4b0d'
          'dde26e50341f7b352c7f3b6c44852778e808bedd')
sha1sums_x86_64=('e4c962fc4dd8b4a5845037c3f3f3904aca08b259')

package() {
  cd "$srcdir/projector-linux-x64/resources/app"

  # Install Postman app resource
  find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/projector/app/{}" \;

  # Install bin
  install -Dm755 "$srcdir/projector.sh" "$pkgdir/usr/bin/projector"

  # Install desktop
  install -Dm755 "$srcdir/projector.desktop" "$pkgdir/usr/share/applications/projector.desktop"

  # Install icons
  install -Dm644 "assets/img/electron-icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/projector.png"

  # Install license
  install -Dm644 "../../LICENSE" "$pkgdir/usr/share/licenses/projector/LICENSE"
}
