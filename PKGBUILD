# Maintainer: Mark Wagie <mark dot wagie at tutanota.com>
# Contributor: spsf64 <at g m a i l  dot com>
pkgname=webapp-manager
pkgver=1.1.9
pkgrel=1
pkgdesc="Run websites as if they were apps"
arch=('any')
url="https://github.com/linuxmint/webapp-manager"
license=('GPL')
depends=('python-beautifulsoup4' 'python-configobj' 'python-gobject' 'python-pillow'
         'python-setproctitle' 'python-tldextract' 'dconf' 'xapp')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a4e2f687e48f90823b3d012486a2fb925f9954fbc3974c90462a5097c1549edf')

prepare() {
  cd "$pkgname-$pkgver"

  # Fix browser names
  sed -i 's/brave-browser/brave/g' \
    "usr/lib/$pkgname/common.py"
  sed -i 's/epiphany-browser/epiphany/g' \
    "usr/lib/$pkgname/common.py"
  sed -i 's/"google-chrome"/"google-chrome-stable"/g' \
    "usr/lib/$pkgname/common.py"
  sed -i 's/microsoft-edge/microsoft-edge-beta/g' \
    "usr/lib/$pkgname/common.py"
  sed -i 's/"vivaldi"/"vivaldi-stable"/g' \
    "usr/lib/$pkgname/common.py"

  # Fix license path
  sed -i 's|common-licenses/GPL/licenses|common/GPL/license.txt|g' \
    "usr/lib/$pkgname/$pkgname.py"

  # Set version in About dialog
  sed -i "s/__DEB_VERSION__/$pkgver/g" \
    "usr/lib/$pkgname/$pkgname.py"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  cp -r etc usr "$pkgdir"
}
