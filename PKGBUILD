# $Id: PKGBUILD 273486 2016-08-07 22:55:07Z arojas $
# Maintainer: Hugo Doria <hugo@archlinux.org>
# Contributor: tardo <tardo@nagi-fanboi.net>
# Contributor: Brice Carpentier <brice@dlfp.org>

pkgname=boo
pkgver=0.9.4.9
pkgrel=4
pkgdesc="A wrist friendly language for the CLI"
arch=('i686' 'x86_64')
url="http://boo.codehaus.org/"
license=('GPL')
depends=('sh' 'mono' 'shared-mime-info')
options=('!makeflags')
source=(https://sources.archlinux.org/other/packages/boo/boo-$pkgver.tar.gz)
md5sums=('e8b04c63d4c983f82e8a2b2d49115c80')
sha1sums=('fdd0f91ae1b2917d83fc8fa7f4610e3c22c06bf9')

build() {
  export MONO_SHARED_DIR="${srcdir}/.wabi"
  mkdir -p $MONO_SHARED_DIR
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i -e 's|/lib|/lib/mono|' extras/boo.pc.in
  ./configure --prefix=/usr --libdir=/usr/lib
  make VERBOSE=1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/share/"
  rm -rf "${pkgdir}/usr/share/gtksourceview-1.0/language-specs/boo.lang"
}
