# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-runlike
_pkgname=runlike
pkgver=1.4.9
pkgrel=1
pkgdesc="Given an existing docker container, prints the command line necessary to run a copy of it"
arch=("any")
url="https://github.com/lavie/runlike"
license=('BSD')
depends=('python-click')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${url}/raw/master/LICENSE.txt")
b2sums=('4822a4648b3b57c3fe8026e1cf0845a92b064a3bc95bca9f9c23663399e9f072a581ca535994e79c1e1a1390f7cebcda14aa17e5a2aa5b1cac66397137d82ba6'
        '63dfe6d6c08298442d1d40cc4db199113527e8124018fc864a008a2f00f2e25ddf9cf4cece3762be8fe4bf6b3f9b788c6c7e9fd2069aaa7ccbc0231f341b5330')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
