# Maintainer: Frank LENORMAND <lenormf@gmail.com>

_gitname=dvtm
pkgname=dvtm-git
pkgver=0.15.37.gb45828d
pkgver() { ( cd $_gitname && git describe | sed 's/^v//; s/-/./g'; ) }
pkgrel=1
pkgdesc='Dynamic virtual terminal manager.'
arch=('i686' 'x86_64')
url='http://www.brain-dump.org/projects/dvtm/'
license=('MIT')
depends=('sh' 'ncurses')
makedepends=(git)
provides=(dvtm)
conflicts=(dvtm)
source=('git://github.com/martanne/dvtm.git'
        'config.h')
md5sums=('SKIP'
         '243bc2d4085c08d9b748f892f5950a00')

prepare() {
	cd "${srcdir}/${_gitname}"

	cp "${srcdir}/config.h" .
	sed -i"" 's/CFLAGS =/CFLAGS +=/' config.mk
}

build() {
	cd "${srcdir}/${_gitname}"

	make clean
	make
}

package() {
	cd "${srcdir}/${_gitname}"

	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	rm -rf "${pkgdir}/usr/share/terminfo"
}
