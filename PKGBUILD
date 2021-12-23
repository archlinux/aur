# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-podman-git
pkgver=3.2.1
pkgrel=2
pkgdesc="Python bindings for Podman's RESTful API"
arch=('any')
url="https://github.com/containers/podman-py"
license=('Apache')
source=("git+$url")
sha256sums=('SKIP')
depends=('python' 'git')
makedepends=('python-setuptools')
conflicts=('python-podman')
provides=('python-podman' 'python-podman-py')

pkgver() {
  git -C podman-py describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  cd podman-py
  python setup.py build
}

package() {
  cd podman-py
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
