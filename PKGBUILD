# $Id: PKGBUILD 221617 2014-09-13 11:13:02Z fyan $
# Maintainer: Felix Yan <felixonmars@gmail.com>
# x32 Maintainer: Fantix King <fantix.king@gmail.com>

_basepkgname=mpdecimal
pkgname=libx32-$_basepkgname
pkgver=2.4.1
pkgrel=1.1
pkgdesc="Package for correctly-rounded arbitrary precision decimal floating point arithmetic (x32 ABI)"
arch=('i686' 'x86_64')
url="http://www.bytereef.org/mpdecimal/index.html"
license=('custom')
depends=('libx32-glibc' $_basepkgname)
source=(http://www.bytereef.org/software/${_basepkgname}/releases/${_basepkgname}-${pkgver}.tar.gz)

build() {
  cd ${_basepkgname}-${pkgver}

  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/libx32
  make
}

package() {
  cd ${_basepkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_basepkgname "$pkgdir/usr/share/licenses/$pkgname"
}

sha512sums=('60073ec82faff1ef9a5955a98f7f1320b044ff03bf8589bfe139b4721ae44c943e16bb36e1e61d9c6016529ba460d879bcbb17ea17cd875b27caa7caea211d45')
