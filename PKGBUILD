# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=iwd-git
pkgver=r1755.8bacbf0
pkgrel=1
pkgdesc='Internet Wireless Daemon'
arch=('i686' 'x86_64')
url='https://git.kernel.org/cgit/network/wireless/iwd.git/'
license=('LGPL')
depends=('glibc')
makedepends=('git')
provides=('iwd')
conflicts=('iwd')
source=('git+https://git.kernel.org/pub/scm/network/wireless/iwd.git'
				'git+https://git.kernel.org/pub/scm/libs/ell/ell.git')
sha256sums=('SKIP' 'SKIP')
_gitname='iwd'

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

	./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${_gitname}"

  make install DESTDIR="${pkgdir}"
}

# vim: set ts=2 sw=2 ft=sh noet:
