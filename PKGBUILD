# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

pkgname=joystickwake
pkgver=0.5.3
pkgrel=2
pkgdesc='A joystick-aware screen waker'
arch=('any')
url='https://codeberg.org/forestix/joystickwake'
makedepends=('python-setuptools')
depends=('python' 'python-pyudev')
conflicts=('joystickwake')
license=('MIT')
source=(
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  295aa926c2c5b82d0727650098e2915e0a4b30d79a4fbbbd9a51406b7a49231d
)

package() {
  # The source archive extracts to joystickwake, but we want
  # a versioned directory name to avoid potential conflicts
  rm -rf "${srcdir}/${pkgname}-${pkgver}"
  mv "${srcdir}/joystickwake" "${srcdir}/${pkgname}-${pkgver}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

