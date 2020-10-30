# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

pkgname=python-pytorch-thop-git
_reponame="pytorch-OpCounter"
_modulename="thop"
pkgver=r112.d1920d3
pkgrel=2
pkgdesc="PyTorch MACs counter"
url="https://github.com/Lyken17/${_reponame}"
license=('MIT')
arch=('any')
depends=('python-pytorch')
makedepends=('python-setuptools')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_reponame}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd ${srcdir}/${_reponame}
  python setup.py build
}

package() {
  cd ${srcdir}/${_reponame}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

