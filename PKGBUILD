# Maintainer: David A. Redick <david.a.redick@gmail.com>
# Contributor: Petteri Tolonen <petteri dot tolonen at gmail dot com>

# Most of this is ripped from the project's own .spec file.
# See http://git.savannah.gnu.org/cgit/freedink.git/tree/freedink.spec

pkgname=freedink
pkgver=108.4
pkgrel=3
pkgdesc='Humorous top-down adventure and role-playing game.'
arch=('i686' 'x86_64' 'mips64el')
url='https://www.gnu.org/software/freedink/'
license=('GPL3')

depends=(
	'freedink-data'
	'libzip'
	'bzip2'
	'zlib'
	'fontconfig'
	'freetype2'
	'sdl_image'
	'sdl_mixer'
	'sdl_ttf'
	'sdl_gfx'
	'sdl'
	'expat'
	'libutil-linux'
	'libpng'
	'harfbuzz'
	'glib2'
	'graphite'
	'pcre'
)

makedepends=('automake' 'autoconf' 'check' 'help2man' 'make')

# Although listed in documents; I don't see a way to enable this.
#optdepends=('timidity++: MIDI-music support')
optdepends=()

source=("ftp://ftp.gnu.org/gnu/freedink/${pkgname}-${pkgver}.tar.gz")
md5sums=('4caccc9235ef68b66bdf4b9174f0af81')
sha256sums=('82cfb2e019e78b6849395dc4750662b67087d14f406d004f6d9e39e96a0c8521')
sha512sums=('1496b6a7826bf694a2919add22a8b4b08a4967d8a7fdebf2d599bd99c7a7ce67de6c2b11124423c7aa1f0feb2e7c03ce1cf00252070182936e7481791dafee61')

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --disable-embedded-resources
	make
}

check () {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# This is just a trivial check.
	make check

	# This for the packaging of the source code in a snap shot package
	# NOT the installed build artifacts.
	#make distcheck
}

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
