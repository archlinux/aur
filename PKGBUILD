# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=adb_shell
pkgname="python-${_pkgname}"
pkgver=0.2.3
pkgrel=1
pkgdesc="A Python implementation of ADB with shell and FileSync functionality."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-aiofiles: async API'
            'python-libusb1: To connect to a device via USB')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname/-/_}/${_pkgname/-/_}-${pkgver}.tar.gz")
sha256sums=('91fd0684564742728864f653045db44acc19db474483a3f4e0c4e0a2a1c7d7f4')
b2sums=('1e47a0d666bbfe1a8b56b1a5977338a382a427400a60e62c3983d7a1c96d1bc66a3df9e242627d2912cb52442ac90bf28e6856f9b31ef6484b3014abe2c7b241')

build() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py build
}

check() {
  cd "${_pkgname/-/_}-${pkgver}"

  export PYTHONPATH="build/lib"
  python setup.py test
}

package() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
