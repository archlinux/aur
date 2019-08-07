# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=lkl-git
_srcname=linux
pkgver=5.0.0r813484.0875fde75e41
pkgrel=1
epoch=
pkgdesc="Linux kernel library"
arch=('x86_64')
url="https://lkl.github.io/"
license=('GPL')
groups=()
depends=(fuse libarchive)
makedepends=(kmod inetutils bc libelf)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"git+https://github.com/lkl/linux.git"
)
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$_srcname"
	printf "%sr%s.%s" "$(make kernelversion)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_srcname"
	sed -i '/tests/d' tools/lkl/Targets
}

build() {
	cd "$_srcname"
	make -C tools/lkl/
}

package() {
	cd "$_srcname"
	make -C tools/lkl/ DESTDIR="$pkgdir/" install
}
