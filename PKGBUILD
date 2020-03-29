# Maintainer: japm48 <japm48gh@gmail.com>

_pkgname=tinyprog
pkgname=python-${_pkgname}-git

pkgver=1.0.24.dev114+g97f6353
pkgrel=2

_reponame=TinyFPGA-Bootloader
_repo=tinyfpga/$_reponame

pkgdesc="TinyFPGA programmer"
arch=('any')
url="https://tinyfpga.com/"
license=('GPL3')

makedepends=(git python-setuptools-scm)
depends=(python python-tqdm python-pyserial python-jsonmerge python-intelhex python-six python-packaging python-pyusb)

source=("git+https://github.com/${_repo}.git")
sha512sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_reponame}/programmer"
  python setup.py --version
}

build() {
  cd "${srcdir}/${_reponame}/programmer"
  python setup.py build
}

package() {
  cd "${srcdir}/${_reponame}/programmer"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

