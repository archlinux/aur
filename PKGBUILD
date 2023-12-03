# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: spsf64 <at g m a i l  dot com>
pkgname=webapp-manager
pkgver=1.3.4
pkgrel=1
pkgdesc="Run websites as if they were apps"
arch=('any')
url="https://github.com/linuxmint/webapp-manager"
license=('GPL')
depends=('dconf' 'python-beautifulsoup4' 'python-configobj' 'python-gobject'
         'python-pillow' 'python-setproctitle' 'python-tldextract' 'xapp')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('818ec1186e028d538b0e7a9237b9fc8c68e804356d322a0a7ba5451c909fcbad')

prepare() {
  cd "$pkgname-$pkgver"

  # Fix license path
  sed -i 's|common-licenses/GPL|licenses/common/GPL/license.txt|g' \
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
