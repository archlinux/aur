# Maintainer: maz-1 <ohmygod19993 at gmail>

_pkgname=unshield
pkgname=${_pkgname}-rawname
pkgver=1.3
pkgrel=1
pkgdesc="Extracts CAB files from InstallShield installers. With extra option to output raw filename."
arch=('i686' 'x86_64')
url="https://github.com/twogood/unshield"
license=('custom')
depends=('zlib' 'openssl')
makedepends=('cmake')
provides=${_pkgname}
conflicts=${_pkgname}
source=("$_pkgname-$pkgver.tar.gz::https://github.com/twogood/unshield/archive/$pkgver.tar.gz"
        "output_raw_filename.diff")
md5sums=('13b716e0a3f45fe74ca24c6aaf4e5bb0'
         'b572cb4632848c8f7ed630d845e00d24')
prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch -p1 < ../output_raw_filename.diff
}
         
build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    .
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/unshield/LICENSE
}
