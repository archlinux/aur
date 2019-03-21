# Maintainer Musikolo <musikolo {at} hotmail [dot] com>

pkgname=kvirustotal
pkgver=0.30.0
pkgdesc="Online antivirus and anti-phishing tool"
pkgrel=5
arch=(i686 x86_64)
url="http://kde-apps.org/content/show.php?content=139065"
license=(GPL3)
groups=('kde' 'security')
makedepends=(cmake automoc4)
depends=(qjson kdelibs qca-qt4)
options=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Musikolo/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0fd19e0e52863a50d592f970cd2a56129e641f32833b019847e05138f3eac590')

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
