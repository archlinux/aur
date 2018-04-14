# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=python-mnist-git
pkgver=0.5.39.8364cb4
pkgrel=1
pkgdesc="Simple MNIST data parser written in Python."
arch=("any")
license=("BSD")
url="https://github.com/sorki/python-mnist"
depends=("python")
makedepends=("python-setuptools")
source=("git+https://github.com/sorki/python-mnist.git")
sha512sums=("SKIP")

pkgver() {
  cd python-mnist
  version=$(grep "VERSION = " setup.py | sed "s/VERSION = '//" | sed "s/'//")
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.$revision.$hash
}

build() {
  cd python-mnist
  python setup.py build
}

package() {
  cd python-mnist
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-mnist-git/LICENSE"
}
