# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: E. Sheldon 
pkgname=python2-fitsio-git
pkgver=r640.507ad1c
pkgrel=1
#epoch=

pkgdesc=" A python library to read from and write to FITS files. "


arch=('i686' 'x86_64')
url="https://github.com/esheldon/fitsio.git"
license=('BSD')
groups=()
depends=('python2')
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
	python2 setup.py build
}


pkgver() {
  cd "$pkgname-$pkgver"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd "$src"
	cd "$pkgname-$pkgver"
	python2 setup.py install --root=${pkgdir} --prefix=/usr
	install -Dm644 gpl.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE	

}
