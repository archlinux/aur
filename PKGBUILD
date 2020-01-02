#Contributor: William J. Bowman <aur@williamjbowman.com>
#Contributor: Gaetan Bisson <bisson@archlinux.org>
#Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=unison-git
pkgver=r2.51.3.26a29f7
pkgrel=1
pkgdesc='File-synchronization tool'
url='http://www.cis.upenn.edu/~bcpierce/unison/'
arch=('i686' 'x86_64')
license=('GPL2')
#optdepends=('gtk2: for gtk2 support')
#makedepends=('ocaml>=4.02' 'lablgtk2' 'imagemagick')
makedepends=('ocaml>=4.02' 'git')
source=("unison-git::git+https://github.com/bcpierce00/unison"
        'desktop')
conflicts=('unison')
provides=('unison')
sha256sums=('SKIP'
            'e9ef4e8b845453e21abafa8c9d153080375024d2465e3bf65f0e5a2ca1f5ea4a')

options=('!makeflags')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(grep '^VERSION=' src/Makefile.ProjectInfo | cut -d = -f 2)" "$(git rev-parse --short HEAD)"
 
}

build() {
	cd "${srcdir}/${pkgname}"
	CFLAGS=""

	make -C src UISTYLE=text THREADS=true
#	for ui in text gtk2; do
#		make clean
#		make -C src UISTYLE=$ui DEBUGGING=false THREADS=true
#		mv src/unison unison-$ui
#	done
}

package() {
	cd "${srcdir}/${pkgname}"

	install -d "${pkgdir}"/usr/bin
#	install -m755 unison-* "${pkgdir}"/usr/bin
	install -m755 src/unison "${pkgdir}"/usr/bin

#	install -d "${pkgdir}"/usr/share/{pixmaps,applications}
#	convert src/win32rc/U.ico[1] "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
#	install -m644 ../desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

#	cd "${pkgdir}"/usr/bin
#	ln -s unison-text unison
#	ln -s unison-gtk2 unison-x11
#	ln -s unison unison-${pkgver%.*}
}
