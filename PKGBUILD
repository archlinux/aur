# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgbase=acarsdec
pkgname=("$pkgbase-airspy" "$pkgbase-rtl-sdr")
pkgver=3.7
pkgrel=1
arch=('x86_64')
url="https://github.com/TLeconte/acarsdec"
license=('GPL')
makedepends=('airspy' 'libusb' 'rtl-sdr')
optdepends=('acarsserv: Store messages in sqlite database')
provides=("$pkgbase")
conflicts=("$pkgbase")
source=("https://github.com/TLeconte/acarsdec/archive/$pkgbase-$pkgver.tar.gz")
sha256sums=('1cb8cab03642bfdfcefb7b003f292cfac0f11051ff07666e714bbb4905717005')

build() {
  cd "$pkgbase-$pkgbase-$pkgver"

  mkdir -p build-airspy
  cd build-airspy
  cmake .. -Dairspy=ON
  make
  cd ..

  mkdir -p build-rtl
  cd build-rtl
  cmake .. -Drtl=ON
  make
  cd ..
}

package_acarsdec-airspy() {
  pkgdesc="Multi-channel ACARS decoder with airspy backend"
  depends=('airspy' 'libusb')

  cd "$pkgbase-$pkgbase-$pkgver"
  install -Dm755 build-airspy/acarsdec "$pkgdir/usr/bin/acarsdec"
}

package_acarsdec-rtl-sdr() {
  pkgdesc="Multi-channel ACARS decoder with rtl_sdr backend"
  depends=('rtl-sdr')

  cd "$pkgbase-$pkgbase-$pkgver"
  install -Dm755 build-rtl/acarsdec "$pkgdir/usr/bin/acarsdec"
}
