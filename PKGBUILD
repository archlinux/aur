# Maintainer Musikolo <musikolo {at} hotmail [dot] com>

pkgname=kvirustotal
pkgver=0.30.0
pkgdesc="Online antivirus and anti-phishing tool"
pkgrel=3
arch=(i686 x86_64)
url="http://kde-apps.org/content/show.php?content=139065"
license=(GPL3)
groups=('kde' 'security')
makedepends=(cmake automoc4)
depends=(qjson kdelibs)
options=()
source=(https://dl.opendesktop.org/api/files/download/id/1466630826/139065-${pkgname}-${pkgver}.tar.bz2)
sha256sums=('3ed9e4f0900f717803efa46d3e578f66ecfaa12593f8c6ae682ff1087ec17794')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX="`kde4-config --prefix`" .
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  _licenses_dir="${pkgdir}`kde4-config --prefix`/share/licenses/${pkgname}"
  install -D AUTHORS "${_licenses_dir}/AUTHORS"
  install -D ChangeLog "${_licenses_dir}/ChangeLog"
  install -D COPYING "${_licenses_dir}/COPYING"
  install -D TODO "${_licenses_dir}/TODO"
}
