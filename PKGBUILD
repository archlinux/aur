# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-runlike
_pkgname=runlike
pkgver=1.4.14
pkgrel=1
pkgdesc="Given an existing docker container, prints the command line necessary to run a copy of it"
arch=("any")
url="https://github.com/lavie/runlike"
license=('BSD')
depends=('python-click')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${url}/raw/master/LICENSE.txt")
b2sums=('0ac93e6ea98f81c69e6f3aaeac614fe3295cd76580548dfcfc991b9b87f962fe4c9eb20c8b80e2e42e87859bbdc38fc50ce4b8251d7509754f6cf3a28bc294ba'
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
