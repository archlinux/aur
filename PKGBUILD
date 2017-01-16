# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=ell-git
pkgver=r1323.98f820a
pkgrel=1
pkgdesc='Embedded Linux library'
arch=('i686' 'x86_64')
url='https://git.kernel.org/cgit/libs/ell/ell.git/'
license=('LGPL')
depends=('glibc')
makedepends=('git')
provides=('ell')
conflicts=('ell')
source=('git+https://git.kernel.org/pub/scm/libs/ell/ell.git')
sha256sums=('SKIP')
_gitname='ell'

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${srcdir}/${_gitname}"
	./bootstrap
}

build() {
  cd "${srcdir}/${_gitname}"

	./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}"

  make install DESTDIR="${pkgdir}"
}

# vim: set ts=2 sw=2 ft=sh noet:
