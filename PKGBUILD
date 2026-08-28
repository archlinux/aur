# Maintainer: Geoffrey D. Bennett <g@b4.vu>
pkgname=fcp-support
pkgver=1.0beta1
pkgrel=1
pkgdesc='FCP (Focusrite Control Protocol) Support for Scarlett 4th Gen 16i16/18i16/18i20 and ISA C8X'
arch=('x86_64')
url="https://github.com/geoffreybennett/$pkgname"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'openssl' 'zlib' 'json-c' 'systemd-libs')
makedepends=('make' 'gcc' 'systemd')
optdepends=('scarlett4-firmware: firmware images for Scarlett 4th Gen devices'
            'alsa-scarlett-gui: graphical control panel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bc6ae19b28dc3c1f4954492c168c5b24f4ca753099421da634b0c75c1e1be68a')

build() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr APP_VERSION="$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr APP_VERSION="$pkgver" DESTDIR="$pkgdir" install
}
