# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=ams-lv2
pkgver=1.2.2
pkgrel=4
pkgdesc="A port of the internal modules found in Alsa Modular Synth"
arch=(x86_64)
url="https://github.com/blablack/ams-lv2"
license=(GPL2)
groups=(lv2-plugins pro-audio)
depends=(gcc-libs glibc lv2-host)
makedepends=(atkmm cairomm fftw glibmm gtkmm libsigc++ lv2 lvtk waf)
source=($pkgname-$pkgver.tar.gz::https://github.com/blablack/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('6c1c6f3179a851f67e162d225a761c38678159d9f178d9bfa3991b84b84ea557f5a44882ea710626204f158c40ae18f0e87f24faec0a0bd6aa64e18eeb81c45f')
b2sums=('1dfeaa2708bda64aadb00d8ec5f57fd3a7dd35a1fdce5fb2289f52f00fd73d25a11f39c91823c9322a5cd625ff369c4b05fd9de300b1635e172aefabb02825ea')

prepare() {
  # remove outdated waflib
  rm -rfv $pkgname-$pkgver/waflib
}

build() {
  cd $pkgname-$pkgver
  export LINKFLAGS="$LDFLAGS"
  waf configure --prefix=/usr
  waf
}

package() {
  depends+=(
    atkmm libatkmm-1.6.so
    cairomm libcairomm-1.0.so
    fftw libfftw3.so
    glibmm libglibmm-2.4.so
    gtkmm
    libsigc++ libsigc-2.0.so
  )
  cd $pkgname-$pkgver
  waf install --destdir="$pkgdir/"
}
