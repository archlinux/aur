# Maintainer: David Runge <dave@sleepmap.de>
pkgname=ams-lv2
pkgver=1.2.2
pkgrel=3
pkgdesc="A port of the internal modules found in Alsa Modular Synth"
arch=('x86_64')
url="https://github.com/blablack/ams-lv2"
license=('GPL2')
groups=('lv2-plugins' 'pro-audio')
depends=('fftw' 'gtkmm')
makedepends=('lv2' 'lvtk' 'waf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blablack/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('6c1c6f3179a851f67e162d225a761c38678159d9f178d9bfa3991b84b84ea557f5a44882ea710626204f158c40ae18f0e87f24faec0a0bd6aa64e18eeb81c45f')

prepare() {
  cd "$pkgname-$pkgver"
  # remove outdated waflib
  rm -rv waflib
}

build() {
  cd "$pkgname-$pkgver"
  waf configure --prefix=/usr
  waf
}

package() {
  cd "$pkgname-$pkgver"
  waf install --destdir="$pkgdir/"
}
