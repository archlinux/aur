# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

pkgname=joystickwake
pkgver=1.0
pkgrel=1
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
sha256sums=('828a44b40ce979ce630b06d80b10cd25c2ded2c46954c7dc1eb1b6bcd0b81dde')

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

