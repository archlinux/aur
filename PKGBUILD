# Contributor: Dany Martineau <dany.luc.martineau gmail com>
# Maintainer: SanskritFritz (gmail)

pkgname=polly-b-gone
pkgver=1.0
pkgrel=7
pkgdesc="3D physics platform game that tells the story of a plucky wheeled robot named Poll"
arch=('i686' 'x86_64')
url="http://cs.stanford.edu/people/mbostock/polly/"
license=('LGPL')
depends=('sdl_mixer' 'sdl_image' 'freeglut' 'glew' 'libgl')
source=('http://danym.org/archlinux/files/polly-src.tar.bz2' \
        'polly-b-gone.png' 'polly-b-gone.desktop' 'lGLU.patch')

build() {
	cd "${srcdir}/polly-src"
	patch -p1 < "${srcdir}/lGLU.patch"
	make
}

package() {
	cd "${srcdir}/polly-src"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	mkdir -p "${pkgdir}/usr/share/polly"
	mkdir -p "${pkgdir}/usr/bin"
	cp -R Contents "${pkgdir}/usr/share/polly"
	cp Polly-B-Gone "${pkgdir}/usr/share/polly/"
	echo "#!/bin/bash" > "${pkgdir}/usr/bin/polly.sh"
	echo "cd '/usr/share/polly/' && ./Polly-B-Gone" >> "${pkgdir}/usr/bin/polly.sh"
	chmod +x "${pkgdir}/usr/bin/polly.sh"
	install "${srcdir}/polly-b-gone.png" "${pkgdir}/usr/share/pixmaps"
	install "${srcdir}/polly-b-gone.desktop" "${pkgdir}/usr/share/applications"
}

md5sums=('a6075c233fcc5a3c0bbf5d9f16683bdc'
         'e7d7277f263b4f9c5d6cd0032555f591'
         '086ab9c4274900488530cc2e70514a19'
         '9c94fd547535ee7e5280eae2042508a7')
