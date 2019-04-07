# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=rtl_biast-git
pkgver=r414.88ac031
pkgrel=1
pkgdesc="Bias tee software for the RTL-SDR.com V3 Dongle"
arch=('i686' 'x86_64')
license=('gpl')
url="https://github.com/rtlsdrblog/rtl_biast"
depends=('rtl-sdr' 'libusb')
makedepends=('git' 'cmake' 'gcc')
source=("$pkgname::git+https://github.com/rtlsdrblog/rtl_biast.git")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"

  mkdir build
  cd build
  
  cmake ..
  make
}

package() {
  cd "${pkgname}"/build/src

  install -Dm755 rtl_biast ${pkgdir}/usr/bin/rtl_biast
}
