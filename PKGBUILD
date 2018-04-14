# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=python-icecream-git
pkgver=1.3.71.cd0113a
pkgrel=1
pkgdesc="Sweet and creamy print debugging."
arch=("any")
license=("MIT")
url="https://github.com/gruns/icecream"
depends=("python")
makedepends=("python-setuptools")
source=("git+https://github.com/gruns/icecream.git")
sha512sums=("SKIP")

pkgver() {
  cd icecream
  version=$(grep __version__ icecream/__init__.py | sed "s/__version__ = '//" | sed "s/'//")
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.$revision.$hash
}

build() {
  cd icecream
  python setup.py build
}

package() {
  cd icecream
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-icecream/LICENSE"
}
