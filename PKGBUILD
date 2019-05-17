# Maintainer: panoskanavos<at>gmail<dot>com 
_pkgname=fast_align
pkgname=${_pkgname}-git
pkgver=r55.7c2bbca
pkgrel=1
epoch=
pkgdesc="Simple, fast unsupervised word aligner"
arch=('x86_64')
url="https://github.com/clab/fast_align.git"
license=('Apache')
groups=()
depends=('python')
makedepends=('cmake' 'gcc' 'git')
checkdepends=()
optdepends=('gperftools' 'openmp' 'sparsehash')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/clab/${_pkgname}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p ${_pkgname}/build
	cd ${_pkgname}/build
	cmake ..
	make -j $(nproc)
}

package() {
	cd "$_pkgname/build"
	install -D -m755 fast_align $pkgdir/usr/bin/fast_align
	install -D -m755 atools $pkgdir/usr/bin/atools
	install -D -m755 force_align.py $pkgdir/usr/bin/force_align.py
}
