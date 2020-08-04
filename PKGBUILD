pkgname=ciphey
pkgver=5.0.0
pkgrel=1
pkgdesc="Automated decryption tool"
arch=("any")
url="https://github.com/Ciphey/Ciphey"
license=('MIT')
depends=('python-cipheycore' 'python-loguru' 'python-yaml'
         'python-appdirs' 'python-requests' 'python-cipheydists'
         'python-rich' 'python-click' 'python-click-spinner'
         'python-yaspin')
makedepends=('python-setuptools' 'python-poetry')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/5.0.0.tar.gz")
sha256sums=('2437811b3cedb87fa2282efd70f122de32daba1401bd11e9eeefbfead87c4236')

build() {
  cd Ciphey-${pkgver}
  python -m poetry build
  cd dist
  tar zxf ${pkgname}-${pkgver}.tar.gz
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd Ciphey-${pkgver}
  install -Dm644 license -t ${pkgdir}/usr/share/licenses/${pkgname}/
  cd dist/${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
