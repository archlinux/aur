# Maintainer: gardar <aur@gardar.net>

pkgname=python-jsonnet
_pkgver=0.21.0-rc1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Python bindings for Google's Jsonnet - The data templating language"
arch=('i686' 'x86_64')
url="https://github.com/google/jsonnet"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer')
source=("$url/archive/v${_pkgver}.tar.gz")
sha512sums=('f019ab7558ac80fa277263142ed73e73e5d97db4d6229603fe0b1817302a8e29f71855daaa79e6e65bcb1dadec71d689bbd150cc1848e567657835e6311a9f82')

build() {
  cd "$srcdir/jsonnet-${_pkgver}"
  export CFLAGS="$CFLAGS -fPIC"
  export CXXFLAGS="$CXXFLAGS -fPIC"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/jsonnet-${_pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
