# Maintainer: Danct12 <danct12@disroot.org>

pkgname=python-gbinder
pkgver=1.0.0
pkgrel=3
pkgdesc="Python bindings for libgbinder"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/erfanoabdi/gbinder-python"
license=('GPL')
depends=('libgbinder')
makedepends=('git' 'python-setuptools' 'cython')
_commit="2e1e05c0a0240d6c06e9bbe9b22dcc35c2e0211c"
source=(${pkgname}::git+https://github.com/erfanoabdi/gbinder-python.git#commit=${_commit}
        '79d40e9e564772973f7f085ed5c48e3fc625e0f5.patch')
sha512sums=('SKIP'
            '9b07a8fec380c7b5cb9de296a8519f3fd71bd59266d6dc888e2cf7a65c57d9d05fd2a2261405c97eb1e79518264971124e977c249037a8e4a60a7d96dcb50897')

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd ${pkgname}
  patch -p1 -N < ../79d40e9e564772973f7f085ed5c48e3fc625e0f5.patch
}

build() {
  cd ${pkgname}
  python3 setup.py build --cython
}

package() {
  cd ${pkgname}
  python3 setup.py install --prefix=/usr --root="$pkgdir"
}
