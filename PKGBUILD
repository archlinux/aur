# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

_name="pytorch-msssim"
pkgname=python-${_name}-git
provides=("python-${_name}")
conflicts=("python-${_name}")
pkgver=r134.a948c90
pkgrel=1
pkgdesc="Fast and differentiable MS-SSIM and SSIM for pytorch"
#url="https://github.com/VainF/${_name}"
url="https://github.com/trougnouf/${_name}"
license=('MIT')
arch=('x86_64')
depends=('python-pytorch')
makedepends=('python-setuptools')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_name}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd ${srcdir}/${_name}
  python setup.py build
}

package() {
  cd ${srcdir}/${_name}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}


