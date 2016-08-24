# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Eric Forgeot < http://esclinux.tk >

pkgname=phlipple-svn
pkgver=0.8.6.r10
pkgrel=1
pkgdesc="A puzzle game which goal is to reduce a 3D shape to a single square. Elimination of squares is done by flipping edges around just like in a cardboard box."
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/phlipple/"
license=('GPL')
depends=('mesa' 'sdl_mixer' 'sdl_image' 'glew')
provides=("phlipple")
conflicts=("phlipple")
source=("phlipple::svn://svn.code.sf.net/p/phlipple/code/trunk"
        'libm.patch')
md5sums=('SKIP'
         '3bc553faf4501f016ab0dd03307c4547')

pkgver() {
	cd "$srcdir/${pkgname%-*}"
	local ver="$(svnversion)"
	conf_ver=`sed -n 's/)$//g;s/^AC_INIT(phlipple, //p' configure.ac`
	printf "${conf_ver:0:5}.r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	cd "$srcdir/${pkgname%-*}"
	patch -Np1 -i "${srcdir}/libm.patch"
}

build() {
	cd "$srcdir/${pkgname%-*}"
	./configure --prefix="/usr"
	make
}

package() {
	cd "$srcdir/${pkgname%-*}"
	make DESTDIR="${pkgdir}" install
}
