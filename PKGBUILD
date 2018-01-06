# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Eric Mandel
_pkgname=funtools
pkgname=funtools-git
pkgver=v1.4.7.r13.9c8bb6f
pkgrel=1
pkgdesc=" FITS library and utility package.  "
arch=('x86_64' 'i686')
url="https://github.com/ericmandel/funtools"
license=('GPL3')
depends=('sh')
makedepends=('git')
source=("${_pkgname}::git+${url}")
#noextract=()
md5sums=('SKIP')

pkgver() {
	 cd $_pkgname
	 printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


build() {
	cd $_pkgname
	./mkconfigure
	./configure --prefix=/usr 
	make
}


package() {
	  cd $_pkgname
	  install -d "$pkgdir"/usr/share/man
	  make DESTDIR="$pkgdir" install
}
