# Maintainer: Andrew Scott <aur at andyscott dot me>
pkgname=fyi
pkgver=1.0.3
pkgrel=1
pkgdesc='A command line utility and notify-send alternative to send desktop notifications'
arch=('x86_64') # any in next release?
url="https://codeberg.org/dnkl/${pkgname}"
license=('MIT')
depends=('dbus')
makedepends=('git' 'meson' 'ninja' 'scdoc')
provides=('fyi')
conflicts=('fyi')
source=("${pkgname}-${pkgver}::git+${url}.git?signed#commit=86ebae882f05aa0412c7377f13807032e0f36182")
b2sums=('SKIP')
validpgpkeys=('B19964FBBA09664CC81027ED5BBD4992C116573F') # Daniel Eklöf (Git signing) <daniel@ekloef.se>

build() {
  export CFLAGS="${CFLAGS} -fno-exceptions"
  arch-meson "${pkgname}-${pkgver}" "${pkgname}-${pkgver}/build"
  meson compile -C "${pkgname}-${pkgver}/build"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson install -C build --destdir "$pkgdir"
  install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
