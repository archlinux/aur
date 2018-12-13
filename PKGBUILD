# Maintainer: Leo Mao
pkgname=python-torchvision-git
_pkgname=vision
pkgver=0.2.1.r62.g8bd05e6
pkgrel=1
pkgdesc="Datasets, Transforms and Models specific to Computer Vision"
arch=('any')
url="https://github.com/pytorch/vision"
_github='pytorch/vision'
license=('BSD')
depends=('python' 'python-numpy' 'python-pillow' 'python-six' 'python-pytorch' 'python-tqdm')
makedepends=('python-setuptools')
provides=('python-torchvision')
conflicts=('python-torchvision')
source=("git+$url")
sha256sums=('SKIP')

pkgver () {
  cd "${_pkgname}"
  (
    set -o pipefail
    git describe --tag 2>/dev/null | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e 's/^v//g'
  )
}

build() {
  msg "Building Python 3"
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
