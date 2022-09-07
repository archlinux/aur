# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>
# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords
pkgver=0.3.5
pkgrel=1
pkgdesc='Crossword player and editor for GNOME'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/crosswords'
license=(GPL3)
depends=(
	libadwaita
	libipuz
	python
)
makedepends=(meson)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/crosswords-${_commit}.tar.gz")
b2sums=('e4ff00a33512117286c1fe592cf0a74a779d7c154fa191f960a192928af3510124bdf5292270539d381b7a6c0fc8c31d61ce8843107cac90ec6bf189285cf9de')

build() {
	arch-meson ${pkgname}-${_commit} build -Ddevelopment=false
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
