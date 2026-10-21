# Maintainer: broroeror <54515333+broroeror@users.noreply.github.com>
pkgname=ambience
pkgver=0.1.0
pkgrel=1
pkgdesc="Unofficial Philips Hue app: rooms, scenes and screen/music sync (not affiliated with Signify)"
arch=('any')
url="https://github.com/broroeror/ambience"
license=('MIT')
depends=('python' 'pyside6' 'qt6-declarative' 'qt6-svg'
         'python-keyring' 'python-cryptography' 'python-numpy' 'python-gobject' 'openssl'
         'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugin-pipewire'
         'xdg-desktop-portal')
optdepends=('avahi: find the bridge on the local network without asking Signify'
            'kwallet: store the bridge keys (or any other Secret Service provider)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f92c528a4c468916edb616c6f1b9e24b2a0082aeb67581cde392ab18d1c672a9')

package() {
  cd "$pkgname-$pkgver"
  find ambience -type f \( -name '*.py' -o -name '*.qml' -o -name 'qmldir' -o -name '*.svg' \
       -o -name '*.ttf' -o -name 'OFL.txt' \) -exec install -Dm644 '{}' "$pkgdir/usr/lib/ambience/{}" \;
  python -m compileall -q -d /usr/lib/ambience "$pkgdir/usr/lib/ambience"

  install -Dm755 packaging/ambience "$pkgdir/usr/bin/ambience"
  install -Dm755 packaging/ambience-cli "$pkgdir/usr/bin/ambience-cli"
  install -Dm644 packaging/ambience.desktop "$pkgdir/usr/share/applications/ambience.desktop"
  install -Dm644 ambience/gui/icons/ambience.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/ambience.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ambience/gui/fonts/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/Manrope-OFL.txt"
}
