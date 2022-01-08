# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=callaudiod
pkgver=0.1.3
pkgrel=1
pkgdesc='Call audio routing daemon'
arch=(x86_64 aarch64)
url='https://gitlab.com/mobian1/callaudiod'
license=(GPL3)
depends=(alsa-lib glib2 libpulse)
makedepends=(meson)
source=("${url}/-/archive/${pkgver}/callaudiod-${pkgver}.tar.gz")
b2sums=('20d398272f2a15d5f76ad3a12297734340c355e26e1de825949bdd76950a769b6f03fedb347b7d30ea827e45f53bdf1b084d276d1cb47f99f36f3aa1e434c49a')

build() {
	arch-meson callaudiod-${pkgver} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
