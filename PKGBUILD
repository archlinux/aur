# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=avvie-git
_app_id=com.github.taiko2k.avvie
pkgver=2.0.r0.g6326118
pkgrel=1
pkgdesc="A utility for quickly cropping images"
arch=('any')
url="https://github.com/Taiko2k/avvie"
license=('GPL3')
depends=('libadwaita' 'python-cairo' 'python-gobject' 'python-piexif' 'python-pillow')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Taiko2k/avvie.git'
        "${pkgname%-git}.sh")
b2sums=('SKIP'
        '0b9462efa971eb7d5ffba08cca71bf7f2c522fdf5ccc6bcb4ca66f6aaea7eb1c84d2d2ee8e9be96a58a1f5cfdad407cf39aa0b4842d31587b1aeeff494debbe8')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  sed -i "s/main.py/${pkgname%-git}/g" "$_app_id.desktop"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 main.py -t "$pkgdir/opt/${pkgname%-git}"
  install -Dm644 "$_app_id.appdata.xml" -t "$pkgdir/usr/share/metainfo"
  install -Dm644 "$_app_id.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$_app_id.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 "$_app_id-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
  install -Dm644 "icon128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_app_id.png"
  install -Dm644 "icon256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_app_id.png"
  install -Dm644 "image-crop.svg" "$pkgdir/usr/share/icons/hicolor/scalable/actions/image-crop.svg"

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
}
