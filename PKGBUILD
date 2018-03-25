# Maintainer: David Runge <dave@sleepmap.de>
_name=infamousPlugins
pkgname=infamousplugins
pkgver=0.2.04
pkgrel=1
pkgdesc="A collection of open-source LV2 plugins"
arch=('x86_64')
url="https://ssj71.github.io/infamousPlugins/"
license=('GPL2')
groups=('lv2-plugins' 'pro-audio')
depends=('fftw' 'ntk' 'zita-resampler')
makedepends=('cmake' 'lv2')
provides=('infamousplugins')
conflicts=('infamousplugins-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ssj71/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('340de9a58f454c3998c71f8c0f004e541253b96ee4c5ac870d6ff0fe07c46764534467dca55046e2a160cfc40c4a252912788bd4140c58efcbe4234730305570')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  mkdir -v build
}

build() {
  cd "$pkgname-$pkgver/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        ..
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
  install -vDm 644 ../{CHANGELOG,README} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
