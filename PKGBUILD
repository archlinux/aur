# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=rtl_biast-git
pkgver=r414.88ac031
pkgrel=3
pkgdesc="Bias tee software for the RTL-SDR.com V3 Dongle"
arch=('i686' 'x86_64')
license=('gpl')
url="https://github.com/rtlsdrblog/rtl_biast"
depends=('libusb')
makedepends=('git' 'cmake' 'gcc' 'patch')
source=("$pkgname::git+https://github.com/rtlsdrblog/rtl_biast.git"
        "rtl_biast.patch")
sha1sums=('SKIP'
          '6ca37b079939dcf6abc14367aa5de88785103d1b')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}/src"

  patch -Np0 -i ${srcdir}/rtl_biast.patch
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
