# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=avvie-git
_app_id=com.github.taiko2k.avvie
pkgver=1.0.beta1.r63.gdda3f95
pkgrel=2
pkgdesc="A GTK app for quick image cropping"
arch=('any')
url="https://github.com/Taiko2k/avvie"
license=('GPL3')
depends=('gtk3' 'libnotify' 'python-cairo' 'python-gobject' 'python-piexif' 'python-pillow')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Taiko2k/avvie.git'
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '2631bd81c05d33bac91c01a2bc0bc242ad03cfdbe3eca14e434ccb4cec044b1e')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
}