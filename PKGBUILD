# Maintainer: sardo <sardonimous@hotmail.com>
pkgname=oorexx
pkgver=4.2.0
pkgrel=1
pkgdesc="open source implementation of Object Rexx"
arch=('x86_64')
url="http://www.oorexx.org/"
license=('CPL')
depends=('bash' 'gcc-libs-multilib')
makedepends=('automake' 'autoconf' 'libtool')
optdepends=('tcsh: for C shell sample'
	    'sh: for sh shell sample')
provides=("rexx")
conflicts=("oorexx-beta")
install=${pkgname}.install
source=(https://sourceforge.net/projects/oorexx/files/oorexx/$pkgver/ooRexx-$pkgver-source.tar.gz
	oorexx-4.2.0-fix-build.patch
	${pkgname}.install)
sha256sums=('ac5af11e7d4d239d2ebe06f40092f4aebf87fc40740b46458bff3b4069ce6e0b'
            '2b4616898a15dd1dd02a23ef2e6f5631b9793844b2e8d616507d3c7a104ab35e'
            'acb81abac7521f4eee40cbdca2338a023d67aae967fefcd9e2f5cf4309ee0ed0')
prepare() {
  cd "ooRexx-${pkgver}"
  patch -p1 -i "${srcdir}/oorexx-4.2.0-fix-build.patch"
}
build() {
  cd "${srcdir}/ooRexx-${pkgver}"
  ./configure --prefix=/usr
  make || return 1
}
package() {
  cd "${srcdir}/ooRexx-${pkgver}"
  make DESTDIR="${pkgdir}/" install || return 1
}
