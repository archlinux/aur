# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: sp1rit <sp1ritCS@protonmail.com>

_basename=clatexmath
pkgname="${_basename}-git"
pkgver=r211.44ea337
pkgrel=1
pkgdesc="A dynamic, cross-platform, and embeddable LaTeX rendering library"
arch=(any)
url="https://github.com/NanoMichael/cLaTeXMath"
license=('MIT')
depends=("gtkmm3" "gtksourceviewmm")
makedepends=("meson")
provides=("${_basename}")
source=("${_basename}::git+https://github.com/NanoMichael/cLaTeXMath.git")
sha256sums=("SKIP")
pkgver() {
	cd "${srcdir}/${_basename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_basename}"
	arch-meson . _build
}

build() {
	cd "${srcdir}/${_basename}"
	ninja -C _build
}

package() {
	cd "${srcdir}/${_basename}"
	DESTDIR="${pkgdir}" meson install -C _build
}
