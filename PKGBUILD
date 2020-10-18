# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=adb_shell
pkgname="python-${_pkgname}"-git
pkgver=0.2.3.r2.gd5bfd5f
pkgrel=2
pkgdesc="A Python implementation of ADB with shell and FileSync functionality."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
depends=('python' 'python-cryptography' 'python-pyasn1' 'python-rsa')
makedepends=('git' 'python-setuptools')
optdepends=('python-aiofiles: async API'
            'python-libusb1: To connect to a device via USB')
provides=('python-adb_shell')
conflicts=('python-adb_shell')
source=("${pkgname}::git+https://github.com/JeffLIrion/adb_shell.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"

  python setup.py build
}

check() {
  cd "${pkgname}"

  export PYTHONPATH="build/lib"
  python setup.py test
}

package() {
  cd "${pkgname}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
