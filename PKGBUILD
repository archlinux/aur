# Maintainer: Aaron Lindsay <aaron@aclindsay.com>

# Name of the Software your PKGBUILD will install - should be unique. See PKGBUILD#pkgname
pkgname=libevhtp

# The version number for the software
pkgver=1.2.10

#The release number for the arch package, as fixes are added to the PKGBUILD, the release number will increase
pkgrel=1

# The description of the package, should be about 80 characters long (one line)
pkgdesc="A more flexible replacement for libevent's httpd API."

# The type of processor this software can build and work on. See PKGBUILD#arch
# Note: armv5te reportedly only works when adding -Wno-traditional to CFLAGS and CXXFLAGS in /etc/makepkg.conf
arch=('i686' 'x86_64' 'armv5te' 'armv6h' 'armv7h')

# The official website for the software your PKGBUILD will install
url="https://github.com/ellzey/libevhtp"

# The License that the software is released under. See PKGBUILD#license
license=('BSD')

# Packages that your software needs to run. If the dependancy requires a minimum version number use the >= operator
depends=('libevent>=2.0.0')

# Packages that must be installed to build the software, but at not necessary to run it
makedepends=('cmake')

# Optional packages that extend the software's functionality
optdepends=()

# List of Package names that this PKGBUILD provides. Put modified packages that will be installed here.
provides=()

# Change the default behavior of makepkg see PKGBUILD#options
options=('staticlibs')

source=("https://github.com/ellzey/libevhtp/archive/${pkgver}.zip")
sha256sums=('32f28292d9b8a3fead4da07e6a4d0e4d8c316585616c3d60d491cdd3271d93e4')

build () {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ./
	make
}

package () {
	#install library and header files
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	#copy license over
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
