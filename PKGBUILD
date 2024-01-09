# Maintainer: euler23 <jordanpaldino@gmail.com>

pkgname=libipuz
pkgver=0.4.5
pkgrel=1
pkgdesc='Library for parsing .ipuz puzzle files'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/libipuz'
license=(LGPL-2.1-or-later OR MIT)
depends=(json-glib)
makedepends=(meson)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/libipuz-${_commit}.tar.gz")
b2sums=('113bc1f42eb973679c2166fb01343f78312dab0609f29f64deda824cb2f512080626caf84c21f3d8c8a1e9953d7c96fac07afb35a54400455089401331b485b4')

build() {
	arch-meson "${pkgname}-${_commit}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
