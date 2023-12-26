# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: zoe < chp321 at gmail >
# Contributor: D. Can Celasun <dcelasun at gmail>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=pytrainer
pkgver=2.2.1
pkgrel=2
pkgdesc='tool to log your sport activities.'
arch=('any')
url="https://github.com/${pkgname}/${pkgname}/wiki"
license=('GPL')
depends=('python-setuptools' 'python-lxml' 'python-matplotlib' 'python-sqlalchemy')
optdepends=('garmintools: "Garmin via garmintools" plugin'
            'gdal: "Elevation correction" plugin'
            'gpsbabel: "Garmin via GPSBabel 1.3.5" plugin'
            'perl: garmin-fit plugin'
            'zenity: garmintools and gpsbabel plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
        ${pkgname}.sh)
md5sums=('2fee7f07868d7185554e2d3e4ba1aeed'
         'd29f67beb31028cf1ecdb85e71d31516')


prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i 's/\/share\/pytrainer\//\/pytrainer\//' "${srcdir}/${pkgname}-${pkgver}/bin/${pkgname}"
  sed -i 's/\/share\/locale/\/locale/' "${srcdir}/${pkgname}-${pkgver}/bin/${pkgname}"
}

build() {
  cd "${pkgname}-${pkgver}"
  
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

  # install launcher
  mv "${pkgdir}"/usr/{bin,share/${pkgname}}/${pkgname}
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
