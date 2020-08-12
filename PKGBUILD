# Maintainer: Joshua Rubin <me at jawa dot dev>

pkgname=jtdxhamlib
pkgver=rc151
pkgrel=1
pkgdesc='Modified hamlib for jtdx'
arch=('x86_64')
url='https://github.com/jtdx-project/jtdxhamlib'
license=('GPL2')
depends=('libusb-1.0.so')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jtdx-project/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('398eda4a9824d9161f80e29286862003')
sha1sums=('b8e2743ccd6933bad90b6f355461b6e9a1e5901d')
sha224sums=('5a9b532cdeba93bfea7fcfb0137bd0100e8368f5c63d531c077857b4')
sha256sums=('cd335541cbe52d5541a9fbf2551b96b4784cce1decf1c0a5d1ece2867aa69792')
sha384sums=('ae4d64f9c1a5927ba417024ee4f95e1befbdc6ed99b1b2e8de4f22282aa17346fad5d88f7dcd110584a9ed9fcc8fcfef')
sha512sums=('c59ca1e879a94b6ec0e7e269583d7d820fe5f07f95de1154c288f585f1684ce07ee57e8a560635b91d047a132659c6eb34fd70af0cd4dc61fe0284328c258539')
b2sums=('aee30e897feac4200d8158d4114b5e0233b9732f70bed3d73db941198469682707c31ba2b861adbfc33aabba6a6fe4ed58e4572948f4aedd40b6c91844d26f07')

prepare() {
  cd "${pkgname}-${pkgver}"
  ./bootstrap
}

build() {
  cd "${pkgname}-${pkgver}"
  rm -rf build
  mkdir build
  cd build
  ../configure \
    "--prefix=/opt/${pkgname}" \
    --disable-shared \
    --enable-static \
    --without-cxx-binding \
    --disable-winradio
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install
}
