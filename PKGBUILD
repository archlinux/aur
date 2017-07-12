# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# sudo lsusb -v | grep switching

set -u
pkgname='uhubctl'
# This allows future release 0.1, 1.0 to be newer than the current release
pkgver='0.0.20170612'; _commit='93173f612a231d808f19f27428d8c87c05975ba4'
pkgrel='1'
pkgdesc='control USB per-port power switching on smart USB hubs'
arch=('x86_64')
url='https://github.com/mvp/uhubctl'
license=('GPL')
depends=('libusb>=1.0.12')
_srcdir="${pkgname}-${_commit}"
source=("${pkgname}-${pkgver}.tgz::https://github.com/mvp/uhubctl/archive/${_commit}.tar.gz")
sha256sums=('fb1514fa55d277190ee7723b1e7a978ceceb91bfd49c6dc38ec98f2cc47c8847')

build() {
  set -u
  cd "${_srcdir}"
  CFLAGS="${CFLAGS} -Wformat-overflow=2" \
  make -j1
  set +u
}


package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 install DESTDIR="${pkgdir}" sbindir='/usr/bin'
  install -Dpm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  set +u
}
set +u
