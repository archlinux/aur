# Maintainer: panoskanavos<at>gmail<dot>com 
_pkgname=sentencepiece
pkgname=${_pkgname}-git
pkgver=r492.ffa2c82
pkgrel=1
epoch=
pkgdesc="Unsupervised text tokenizer for Neural Network-based text generation"
arch=('x86_64')
url="https://github.com/google/sentencepiece"
license=('Apache')
groups=()
depends=()
makedepends=('git' 'cmake' 'gcc')
checkdepends=()
optdepends=('gperftools')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/google/${_pkgname}.git")
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
	make DESTDIR="$pkgdir/" install
}
