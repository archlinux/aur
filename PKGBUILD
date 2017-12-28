# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor:  M. Jarvis
pkgname=tmv
pkgver=r101.fab5df3
pkgrel=1
#epoch=

pkgdesc=" A fast, intuitive linear algebra library for C++ "


arch=('x86_64')
url="https://github.com/rmjarvis/tmv/"
license=('BSD')
groups=()
depends=('cblas')
makedepends=('git')
checkdepends=()
optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+${url}")
#noextract=()
md5sums=('SKIP')
#validpgpkeys=()


build() {
	cd "$src"	
	cd "$pkgname-$pkgver"
	scons PREFIX=/usr
}


pkgver() {
  cd "$pkgname-$pkgver"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd "$src"
	cd "$pkgname-$pkgver"
	scons PREFIX=$pkgdir/usr install
	# scons install  PREFIX=/data
	# scons install --prefix "${pkgdir}"
	install -Dm644 TMV_LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

}
