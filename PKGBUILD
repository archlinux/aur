# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

_pkgbasename=libxslt
pkgname=lib32-$_pkgbasename
pkgver=1.1.26
pkgrel=4
pkgdesc="XML stylesheet transformation library (32-bit)"
arch=('x86_64')
url="http://xmlsoft.org/XSLT/"
license=('custom')
depends=('lib32-libxml2>=2.7.7' 'lib32-libgcrypt>=1.4.4' $_pkgbasename)
makedepends=(gcc-multilib)
options=('!libtool')
source=(ftp://xmlsoft.org/libxslt/${_pkgbasename}-${pkgver}.tar.gz)
md5sums=('e61d0364a30146aaa3001296f853b2b9')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32 --without-python
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
