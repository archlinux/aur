# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-runlike
_pkgname=runlike
pkgver=1.3.1
pkgrel=1
pkgdesc="Given an existing docker container, prints the command line necessary to run a copy of it"
arch=("any")
url="https://github.com/lavie/runlike"
license=('BSD')
depends=('python-click')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${url}/raw/master/LICENSE.txt")
sha256sums=('577d73f9c37f7ebfdb40922650db57ff1d9b92a2bce22ff02dbcf22ffc72c046'
            '4daf3259296ec4d1725cb4a3061d1493e48abe29a83d9e0243298d90cd5dfe09')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
