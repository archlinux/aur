# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=aml1
pkgver=1.0.0
pkgrel=1
pkgdesc='Another Main Loop'
arch=(x86_64 i686 aarch64 armv7h)
url=https://github.com/any1/aml
license=(custom:ISC)
depends=(glibc)
makedepends=(meson ninja)
provides=(libaml.so.1)
source=("aml-v$pkgver.tar.gz::https://github.com/any1/aml/archive/v$pkgver.tar.gz")
b2sums=("8d045db7d0317b48c164f6d7c40f887d94ec435730f870baf161ee8f7e99314b9bdd4d5311cce03ee5a0ee784c93558795d5e742f4832bbe295e2b66072a5196")

build() {
  cd aml-$pkgver
  pwd
  arch-meson build
  meson compile -C build
}

package() {
  cd aml-$pkgver
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 COPYING -t "${pkgdir}"/usr/share/licenses/aml1
  sed -i 's/-laml/-l:libaml.so.1/' "${pkgdir}"/usr/lib/pkgconfig/aml1.pc
  rm -f "${pkgdir}"/usr/lib/libaml.so
}

# vim: ts=2 sw=2 et:
