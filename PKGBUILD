# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: quequotion <quequotion@gmail.com>

pkgname=musicbrainz
pkgver=2.1.5
pkgrel=8
pkgdesc="The second generation incarnation of the CD Index"
arch=('i686' 'x86_64')
url="http://www.musicbrainz.org/index.html"
license=('LGPL')
depends=('expat' 'gcc-libs')
makedepends=('python2')
options=('!libtool')
source=("ftp://ftp.musicbrainz.org/pub/$pkgname/historical/libmusicbrainz-${pkgver}.tar.gz"
	'gcc4.3.patch'
	'gcc6-fix-errors.patch')
md5sums=('d5e19bb77edd6ea798ce206bd05ccc5f'
         '9455555d03e3bd15d488ffdb2287ffa7'
         '92ebdb6bc65df929bc532b1e6cf78756')

prepare() {
cd "${srcdir}/lib${pkgname}-${pkgver}"
patch -p1 -i ${srcdir}/gcc4.3.patch
patch -p1 -i ${srcdir}/gcc6-fix-errors.patch
}

build() {
cd "${srcdir}/lib${pkgname}-${pkgver}"
./configure --prefix=/usr
make
}

package() {
cd "${srcdir}/lib${pkgname}-${pkgver}"
make DESTDIR="${pkgdir}" install
}

