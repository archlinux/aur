# Contributor (Arch): Jussi Timperi <jussi.timperi at gmail dot com>
# Maintainer: André Silva <emulatorman@parabola.nu>

pkgname=openfwwf
pkgver=5.2
pkgrel=2
pkgdesc="Free firmware for some Broadcom 43xx series WLAN chips"
arch=('any')
url="http://www.ing.unibs.it/openfwwf/"
license=('GPL2')
makedepends=('b43-tools')
source=(http://www.ing.unibs.it/openfwwf/firmware/$pkgname-$pkgver.tar.gz)
md5sums=('e045a135453274e439ae183f8498b0fa')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's|Opensource|Free|' LICENSE
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX="$pkgdir/usr/lib/firmware" install

  install -d -m755 $pkgdir/usr/share/licenses/$pkgname
  install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
