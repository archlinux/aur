# Maintainer: Philipp Lenk <philipplenk at codemetas dot de>

pkgname="fernanda"
pkgver="0.1.0_beta0"
pkgrel="1"

pkgdesc="Editor for drafting long-form fiction"
url="https://github.com/fairybow/fernanda"

arch=("x86_64")

depends=(p7zip qt6-base)
makedepends=(cmake git) 

license=("GPL3")

_repo="https://github.com/fairybow/fernanda"
_commit="c3672f879f210392033b1a37cce13570867c2e53"
source=("git+${_repo}.git#commit=${_commit}")

sha256sums=('SKIP')

build()
{
	mkdir -p "${srcdir}/${pkgname}/fernanda/build"
	cd "${srcdir}/${pkgname}/fernanda/build"
	echo "install(TARGETS fernanda RUNTIME)" >> ../CMakeLists.txt
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../
	make
}

package()
{
	cd "${srcdir}/${pkgname}/fernanda/build"
	make DESTDIR="${pkgdir}/" install
}


