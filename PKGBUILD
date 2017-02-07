# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

pkgname=zarafa-libical
pkgver=7.2.0
_pkgmajver=7.2
_pkgrev=${pkgver}-48204
_libicalver=0.44
pkgrel=261
pkgdesc="An open source reference implementation of the icalendar data type and serialization format"
arch=('armv7h'
      'armv6h'
      'x86_64'
      'i686')
url="http://www.vmime.org/"
license=('GPL')
depends=('glibc')
makedepends=('')
provides=("libical=${_libicalver}")
source=("https://download.zarafa.com/community/final/7.1/7.1.7-42779/sourcecode/libical-${_libicalver}.tar.gz"
	"https://download.zarafa.com/community/final/${_pkgmajver}/${_pkgrev}/sourcecode/libical-patches/libical-byday-loop.diff"
	"https://download.zarafa.com/community/final/${_pkgmajver}/${_pkgrev}/sourcecode/libical-patches/libical-configure-undef-fatal-errors.diff"
	"https://download.zarafa.com/community/final/${_pkgmajver}/${_pkgrev}/sourcecode/libical-patches/libical-event-outside-timezone-def.diff"
	"https://download.zarafa.com/community/final/${_pkgmajver}/${_pkgrev}/sourcecode/libical-patches/libical-nth-recur-overflow.diff"
	"https://download.zarafa.com/community/final/${_pkgmajver}/${_pkgrev}/sourcecode/libical-patches/libical-win32-add-generated-files.diff"
	"https://download.zarafa.com/community/final/${_pkgmajver}/${_pkgrev}/sourcecode/libical-patches/libical-win32-fix-compile-errors.diff")

md5sums=('e0403c31e1ed82569325685f8c15959c'
         '2af5986253a13374463fcafa15873a8e'
         'a1f66c955737c5e227c25467fc241f5c'
         '23c5c1355539cbf66252c6a831ad2f5c'
         '0088ac43572185b52f525c0d534f42e5'
         'e641a1e9af799c056e52f31cf5f0f991'
         '26c814b710ea249b748e531f7930a5ef')

prepare() {
        cd $srcdir/libical-${_libicalver}
        
	# Patching
	for pa in ../*.diff; do
	    echo "Patching ${pa}"
	    patch -p1 <${pa}
	done
}

build() {
        cd $srcdir/libical-${_libicalver}

	./configure --prefix=/usr
	make
}

package() {
        cd $srcdir/libical-${_libicalver}

	make install DESTDIR="$(realpath ${pkgdir})"
        #scons prefix=$pkgdir/usr install  || return 1
}
