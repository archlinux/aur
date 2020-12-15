# Maintainer: <asamk@gmx.de>

pkgname=libzkgroup
_pkgname=zkgroup
pkgver=0.7.1
pkgrel=1
pkgdesc="Library for the Signal Private Group System."
url="https://github.com/signalapp/${_pkgname}"
depends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/v$pkgver.tar.gz")

sha256sums=('6f9a0d46632c8a44f1d47cfd9c861f9a7673664360a82eee75edd582ab2f2bdb')

prepare() {
  tar xf ${pkgname}-$pkgver.tar.gz
  cd "${_pkgname}-$pkgver"

  # Use the default system rust toolchain
  rm rust-toolchain
}

build() {
  cd "${_pkgname}-$pkgver"
  make libzkgroup
}

package() {
  cd "${_pkgname}-$pkgver"
  install -Dm644 "target/release/$pkgname.so" "$pkgdir/usr/lib/$pkgname.so"
}
