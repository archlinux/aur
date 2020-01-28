# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Yoep Kortekaas <yoep dot kortekaas at gmail dot com>
pkgname=helib-git
pkgver=1.0.0.beta1.Aug2019.r52.072ffc8
pkgrel=1
pkgdesc="A software library that implements homomorphic encryption (HE) through the BGV scheme"
arch=('i686' 'x86_64')
url="https://homenc.github.io/HElib/"
license=('Apache')
groups=()
depends=('gmp>=6.0.0' 'ntl>=11.0.0')
makedepends=('cmake>=3.5.1' 'make' 'gcc>=5.4.0' 'libpthread-stubs' 'git')
provides=("helib")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('helib::git+https://github.com/homenc/HElib.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
}
