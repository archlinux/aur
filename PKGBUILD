# Maintainer: mar77i <mar77i at mar77i dot ch>
# Past Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>

pkgname=st-luke-git
_pkgname=st-luke
pkgver=0.8.1.r1048
pkgrel=1
pkgdesc='Simple virtual terminal emulator for X'
url='http://st.suckless.org/'
arch=('i686' 'x86_64')
license=('MIT')
options=('zipman')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
epoch=1
# include config.h and any patches you want to have applied here
source=("${_pkgname}::git+https://github.com/LukeSmithxyz/st.git")
sha256sums=('SKIP')
provides=("${_pkgname}" 'st')
conflicts=("${_pkgname}" 'st')

pkgver() {
  cd "${_pkgname}"
  echo "0.8.1.r$(git rev-list --count HEAD)"
}

prepare() {
  cd "${_pkgname}"
  sed -i '8s+mono:Pixelsize?16+Luxi Mono:Pixelsize?10+' config.h
}

build() {
	cd "${_pkgname}"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
