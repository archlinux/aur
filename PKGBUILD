# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-runlike
_pkgname=runlike
pkgver=1.4.4
pkgrel=1
pkgdesc="Given an existing docker container, prints the command line necessary to run a copy of it"
arch=("any")
url="https://github.com/lavie/runlike"
license=('BSD')
depends=('python-click')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${url}/raw/master/LICENSE.txt")
b2sums=('46fba38589a6871d20555ea654c7e857b0e58784dd925abd5a15d683f6fd4054b2aa1e935f8eaf920f1e4df019cc73361c18e8250662f0fe291965c139b21514'
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
