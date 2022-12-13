# Maintainer: Mark Wagie <mark dot wagie at tutanota.com>
# Contributor: spsf64 <at g m a i l  dot com>
pkgname=webapp-manager
pkgver=1.2.8
pkgrel=1
pkgdesc="Run websites as if they were apps"
arch=('any')
url="https://github.com/linuxmint/webapp-manager"
license=('GPL')
depends=('python-beautifulsoup4' 'python-configobj' 'python-gobject' 'python-pillow'
         'python-setproctitle' 'python-tldextract' 'dconf' 'xapp')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('96b3c1886981e24b8704d85168f1ed7459b1a76820af031a28242e22178391c8')

prepare() {
  cd "$pkgname-$pkgver"

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
