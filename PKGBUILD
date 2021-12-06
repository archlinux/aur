# Maintainer: Mark Wagie <mark dot wagie at tutanota.com>
# Contributor: spsf64 <at g m a i l  dot com>
pkgname=webapp-manager
pkgver=1.1.7
pkgrel=1
pkgdesc="Run websites as if they were apps"
arch=('any')
url="https://github.com/linuxmint/webapp-manager"
license=('GPL')
depends=('python-beautifulsoup4' 'python-configobj' 'python-gobject' 'python-pillow'
         'python-setproctitle' 'python-tldextract' 'dconf' 'xapp')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f5764d1876f0729c25ff3e2922bb073abeeea24d1f7b0b83f32fdff4b42e2679')

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
