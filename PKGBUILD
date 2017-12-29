# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: E. Sheldon 
pkgname=python2-fitsio-git
pkgver=v0.9.12rc1.r22.507ad1c
pkgrel=1
pkgdesc=" A python library to read from and write to FITS files. "
arch=('i686' 'x86_64')
url="https://github.com/esheldon/fitsio.git"
license=('BSD')
depends=('python2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
md5sums=('SKIP')

pkgver() {
  	 cd "$srcdir/${pkgname%-git}"
	 printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


build() {
	cd "$srcdir/${pkgname%-git}"
	python2 setup.py build
}


package() {
	  cd "$srcdir/${pkgname%-git}"	
	  python2 setup.py install --root=${pkgdir} --prefix=/usr
	  install -Dm644 gpl.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE	

}
