# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=fortune-mod-git
pkgver=r283.a18575a
pkgrel=1
pkgdesc='Maintenance version of fortune-mod from redellipse.net'
arch=('i686' 'x86_64')
url='https://github.com/shlomif/fortune-mod'
license=('BSD')
depends=('ack' 'perl-file-find-object' 'perl-io-all' 'perl-list-moreutils')
makedepends=('git' 'cmake')
provides=('fortune-mod')
conflicts=('fortune-mod')
source=('git://github.com/shlomif/fortune-mod.git')
sha256sums=('SKIP')
_gitname='fortune-mod'

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	mkdir -p "${srcdir}/${_gitname}/${_gitname}/cmake"
}

build() {
  cd "${srcdir}/${_gitname}/${_gitname}/cmake"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_MODULE_PATH=/usr/share/cmake/Modules -DCOOKIEDIR=/usr/share/fortune -DOCOOKIEDIR=/usr/share/fortune/off ..
  make
}

package() {
  cd "${srcdir}/${_gitname}/${_gitname}/cmake"

  make install DESTDIR="${pkgdir}"
	mv "${pkgdir}/usr/games/fortune" "${pkgdir}/usr/bin/"
	rmdir "${pkgdir}/usr/games"
}

# vim: set ts=2 sw=2 ft=sh noet:
