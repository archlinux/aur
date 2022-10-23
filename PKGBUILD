# Maintainer:  <castix at autistici dot org>
pkgname=airwindows-lv2-git
pkgver='12.0'
pkgrel=2
epoch=
pkgdesc="This is an LV2 port of the Airwindows plugins made by Chris Johnson. Porting accomplished by Hannes Braun"
arch=('i686' 'x86_64')
url="https://github.com/hannesbraun/airwindows-lv2"
license=('MIT')
groups=('lv2-plugins')
depends=('glibc')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/hannesbraun/airwindows-lv2')
md5sums=('SKIP')


build() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p build
  meson setup build -Dlv2dir=/usr/lib/lv2
  meson compile -C $srcdir/${pkgname%-git}/build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  meson install -C $srcdir/${pkgname%-git}/build --destdir ${pkgdir}

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp "../${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
