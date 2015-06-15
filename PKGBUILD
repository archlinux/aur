# Maintainer: Daniel Kirchner <ekpyron@lavabit.com>
pkgname=yaml-cpp-hg
pkgver=553
pkgrel=2
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec"
url="http://code.google.com/p/yaml-cpp/"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('cmake' 'mercurial')
conflicts=('yaml-cpp' 'yaml-cpp-experimental-hg')
_hgroot="https://code.google.com/p"
_hgrepo="yaml-cpp"

build() {

	cd "${srcdir}"
  	msg "Connecting to Mercurial server...."

  	if [[ -d "$_hgrepo" ]]; then
    	   cd "$_hgrepo"
    	   hg pull -u
    	   msg "The local files are updated."
  	else
	   hg clone "$_hgroot/$_hgrepo"
  	fi
  
	msg "Starting build..."

	cd "$srcdir/$_hgrepo"
	msg "Starting make..."

	rm -rf "$srcdir/$_hgrepo-build"
	mkdir "$srcdir/$_hgrepo-build"
	cd "$srcdir/$_hgrepo-build"
	
	cmake ../$_hgrepo -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$_hgrepo-build"
	make DESTDIR=$pkgdir install
}
