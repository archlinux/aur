# Maintainer: Tobias Kieslich <neri@archlinux.org>
# Contributor: Ben <contrasutra@myrealbox.com>

_pkgbasename=lcms
pkgname=lib32-$_pkgbasename
pkgver=1.19
pkgrel=6
pkgdesc="Lightweight color management development library/engine (32-bit)"
arch=(x86_64)
license=('custom')
depends=('lib32-libtiff>=3.9.4' $_pkgbasename)
makedepends=(gcc-multilib)
url="http://www.littlecms.com"
source=(http://downloads.sourceforge.net/sourceforge/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz)
sha512sums=('85a55ad0673f0df2aaa80d18caa50314319f8da5ee4d84eed919059d0dad9861d684ef6353ce0ec6f9892a4603ce8e8e12f84d46858e23f52846b8aefd3cf449')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${srcdir}/${_pkgbasename}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}

  make DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
