# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: ianux <ianux@free.fr>

pkgname=asdcplib
pkgver=2.10.37
_pkgver=2_10_37
pkgrel=1
pkgdesc="Open Source implementation of SMPTE and the MXF Interop “Sound & Picture Track File” format"
arch=('i686' 'x86_64')
url="http://www.cinecert.com/asdcplib/"
license=('GPL3')
depends=('openssl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cinecert/asdcplib/archive/rel_${_pkgver}.tar.gz")
sha256sums=('2e9e46458c888ffa1458fb4b8e20146a34f064cd860f23dd251bd1e6122aca98')

prepare() {
  cd ${pkgname}-rel_${_pkgver}
  autoreconf -if
  ./configure --enable-freedist --enable-as-02 --prefix=/usr
}

build() {
  cd ${pkgname}-rel_${_pkgver}
  make
  make dist
}

package() {
  cd ${pkgname}-rel_${_pkgver}
  make DESTDIR=${pkgdir} install
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s /usr/share/licenses/common/GPL3/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}