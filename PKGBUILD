# Maintainer: cscs <cscs at disroot dot org>

pkgname=musikwave-git
_gitname=musikwavedesktop-portable
pkgver=r31.997a072
pkgrel=1
pkgdesc="Desktop MusikWave client using electron"
arch=('x86_64')
url="https://www.musikwave.com"
license=('MIT')
depends=()
makedepends=(git)
source=("${_gitname}::git+https://gitlab.com/cscs/musikwavedesktop.git")
md5sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_gitname}
    rm -rf .git
}

package() {
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/pixmaps
  install -d ${pkgdir}/usr/share/applications
  install -d ${pkgdir}/usr/share/musikwave
  make -C ${srcdir}/${_gitname} DESTDIR=${pkgdir}/ install
}
