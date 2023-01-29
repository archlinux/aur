# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>
# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords
pkgver=0.3.7.2
pkgrel=1
pkgdesc='Crossword player and editor for GNOME'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/crosswords'
license=(GPL3)
depends=(
	libadwaita
	libipuz
	python-argparse
	python-beautifulsoup4
	python-lxml
	python-regex
)
makedepends=(meson)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/crosswords-${_commit}.tar.gz")
b2sums=('dfd3a566e2cf137efc545e6d48d0fff55527c56b2c41ba884b5cc06001cf4b87f11e744910a2c8e95512d04bd7ab9c9733dafcf593563b19e28d7a1c2d42c550')

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
