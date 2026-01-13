# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

pkgname=joystickwake
pkgver=0.5.1
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
  dc92d814d6ecf604914855f08aed8fc4d53d181ac3b48c1c08374db298cb20e2
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

