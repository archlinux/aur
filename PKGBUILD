# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

_name="piqa"
pkgname=python-pytorch-${_name}-git
provides=("python-pytorch-${_name}")
conflicts=("python-pytorch-${_name}")
pkgver=1.1.3+3+g2205651
pkgrel=1
pkgdesc="PyTorch Image Quality Assessment"
url="https://github.com/francois-rozet/${_name}"
license=('MIT')
arch=('x86_64')
depends=('python-pytorch')
makedepends=('python-setuptools')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_name}
  git describe --tags | sed 's/-/+/g;s/v//;'
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

