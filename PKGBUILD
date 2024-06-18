# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: spsf64 <at g m a i l  dot com>
pkgname=webapp-manager
pkgver=1.3.6
pkgrel=1
pkgdesc="Run websites as if they were apps"
arch=('any')
url="https://github.com/linuxmint/webapp-manager"
license=('GPL-3.0-or-later')
depends=(
  'dconf'
  'python-beautifulsoup4'
  'python-configobj'
  'python-gobject'
  'python-pillow'
  'python-setproctitle'
  'python-tldextract'
  'xapp'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('512c214e7c8ab5c3750613fb3292bd03f8a6eedd6e48fbb915320e7a0a914315')

prepare() {
  cd "$pkgname-$pkgver"

  # Set version in About dialog
  sed -i "s/__DEB_VERSION__/$pkgver/g" \
    "usr/lib/$pkgname/$pkgname.py"

  # Fix license path
  sed -i 's|common-licenses/GPL|licenses/spdx/GPL-3.0-or-later.txt|g' \
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
