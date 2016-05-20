# Maintainer: Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>
# Contributor: mosra <mosra@centrum.cz>

pkgname=mypaint-git
pkgver=1.2.0.r237.gf2e1648
pkgrel=1
pkgdesc="A fast and easy painting application for digital painters, with brush dynamics"
arch=('i686' 'x86_64')
url="http://mypaint.org/"
license=('GPL')
depends=('desktop-file-utils' 'gtk3' 'gegl' 'babl' 'json-c' 'python2-cairo' 'python2-gobject' 'python2-numpy' 'libmypaint-git')
makedepends=('git' 'scons' 'swig')
provides=('mypaint')
conflicts=('mypaint')
install=mypaint-git.install
source=('git+https://github.com/mypaint/mypaint.git'
        'mypaint-git.install'
)

pkgver() {
	cd "$srcdir/mypaint"
	git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/mypaint"
}

build() {
	cd "$srcdir/mypaint"
	scons prefix="/usr" enable_gegl=true use_sharedlib=yes
}

package() {
	cd "$srcdir/mypaint"
	scons prefix="/usr" enable_gegl=true use_sharedlib=yes --install-sandbox="$pkgdir" "$pkgdir"
}

sha256sums=('SKIP'
            '34dec9df2e005de9fae6c6352f49835a1d41e515c6131ed1df8c9e27ee3c9d1d')
