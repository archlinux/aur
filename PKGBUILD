# Maintainer: euler23 <jordanpaldino@gmail.com>

pkgname=libipuz
pkgver=0.4.6
pkgrel=1
pkgdesc='Library for parsing .ipuz puzzle files'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/libipuz'
license=(LGPL-2.1-or-later OR MIT)
depends=(json-glib)
makedepends=(meson)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/libipuz-${_commit}.tar.gz")
b2sums=('1fe0f8c987c864a2ff8799028fb83850c1cfedeb48abf00c414c796d77a41ea51d75b3ea842d6193b2b0eeb737e44c5841ab78745e2559656eef9b847db57505')

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
