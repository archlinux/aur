# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=bticino-easykit-bin
_pkgname=bticino-easykit
pkgver=0.2.0
pkgrel=1
pkgdesc="Unofficial client for the BTicino EASYKIT WiFi video door entry kit (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/deddroid/bticino-easykit"
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'hicolor-icon-theme')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!lto' '!strip')
source=("$_pkgname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x86_64.tar.gz")
sha256sums=('bbdb7c925eeda194d5172de927acdf0d6b5ee36c6756e3c5ed97b2a919b694c9')

package() {
  cd "$_pkgname-v$pkgver-linux-x86_64"
  install -Dm755 bticino-easykit "$pkgdir/usr/bin/bticino-easykit"
  install -Dm755 bticino-easykit-gui "$pkgdir/usr/bin/bticino-easykit-gui"
  install -Dm644 packaging/linux/bticino-easykit.desktop "$pkgdir/usr/share/applications/bticino-easykit.desktop"
  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/icons/bticino-easykit-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/bticino-easykit.png"
  done
  install -Dm644 assets/icons/bticino-easykit.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/bticino-easykit.svg"
  install -Dm644 LICENSE THIRD-PARTY-LICENSES.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md README.it.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
