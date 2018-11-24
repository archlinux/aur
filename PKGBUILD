# Maintainer: Hugo "ThePooN" Denizart <thepoon at cartooncraft dot fr>

_pkgname=nss-docker
pkgname=nss-docker-git
pkgver=r64.45db418
pkgrel=1
pkgdesc='NSS module for finding Docker containers'

url='https://github.com/dex4er/nss-docker'
license=('GPL2')

source=('git+https://github.com/dex4er/nss-docker.git')
sha256sums=('SKIP')

arch=('any')

makedepends=('git')

conflicts=('nss-docker')
provides=('nss-docker')

install="$pkgname".install

pkgver() {
	cd "${srcdir}/${_pkgname}"

	# Get the version number.
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"

	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"

	make install DESTDIR="$pkgdir"
}
