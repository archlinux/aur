# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: spsf64 <at g m a i l  dot com>
pkgname=webapp-manager
pkgver=1.4.1
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
sha256sums=('ec19cae538b3be743f98640933483f94be56e270fa0c0a6dd28182e14a9f3d86')

prepare() {
  cd "$pkgname-$pkgver"

  # Set version in About dialog
  sed -i "s/__DEB_VERSION__/$pkgver/g" \
    "usr/lib/$pkgname/$pkgname.py"

  # Fix license path
  # Dialog expands too wide
#  sed -i 's|common-licenses/GPL|licenses/spdx/GPL-3.0-or-later.txt|g' \
#    "usr/lib/$pkgname/$pkgname.py"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  cp -r etc usr "$pkgdir"
}
