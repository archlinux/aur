# Maintainer: Johannes Loher <johannes dot loher at fg4f dot de>

_gitname=codecrypt
pkgname="${_gitname}-git"
pkgver=1.7.3.r17.gce35afb
pkgrel=1
pkgdesc='The post-quantum cryptography tool - git version'
arch=('x86_64' 'i686')
url='http://e-x-a.org/codecrypt/'
license=('LGPL3')
depends=('gmp' 'fftw>=3.0' 'crypto++')
makedepends=('git')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=('git://github.com/exaexa/codecrypt.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_gitname}"
	./autogen.sh
	./configure LIBS=-lpthread --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${_gitname}"
	make -k check
}

package() {
	cd "${srcdir}/${_gitname}"
	make DESTDIR="$pkgdir/" install
}
