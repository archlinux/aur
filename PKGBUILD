# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>
# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords
pkgver=0.3.3
pkgrel=1
pkgdesc='Crossword player and editor for GNOME'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/crosswords'
license=(GPL3)
depends=(
	libadwaita-git
	libipuz
	python
)
makedepends=(meson)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/crosswords-${_commit}.tar.gz")
b2sums=('44f3a9095e01d8837c5f76f79cc96e543201565b4ce1e8948ef3630f81e6b30820af5a1861b6339dcdadaab87eb5d586c163b7bd894d1886a5d1291cd9642855')

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
