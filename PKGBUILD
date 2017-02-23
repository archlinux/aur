# Maintainer: Hans Gaiser <hansg91@gmail.com>

pkgname=multitask-network-cascades-dr-git
pkgver=0.r62.341df23
pkgrel=1
pkgdesc='A framework containing Caffe layers for running the Multitask-Network-Cascades algorithm.'
arch=(x86_64)
url='github.com/delftrobotics/MNC'
license=('BSD')

depends=(
	'caffe'
)

source=('git+https://github.com/delftrobotics-forks/MNC.git')
makedepends=('git')
provides=('multitask-network-cascades-git')
conflicts=('multitask-network-cascades-git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/MNC"
	echo -n '0.'
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/MNC/lib"
	python setup.py build
}

package() {
	cd "$srcdir/MNC/lib"
	python setup.py install --root="${pkgdir}/"

	## Install BSD License
	install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	## Install Documentation
	install -D -m644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
