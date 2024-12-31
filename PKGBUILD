# Maintainer: Blair Bonnett <blair dot bonnett at gmail>

pkgname=python-plyfile
pkgdesc="Read and write ASCII and binary PLY files"
pkgver=1.1
pkgrel=2
url='https://github.com/dranjan/python-plyfile'
arch=('any')
license=('GPL-3.0-or-later')

depends=(
  'python-numpy'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-pdm-backend'
)
checkdepends=(
  'python-pytest'
)

source=(
  "git+https://github.com/dranjan/python-plyfile.git#tag=v$pkgver"
  'update_build_system.patch'
)
sha256sums=(
  '354e26372bbdd683f586ff97b60e11446b7f4b52e7eaaef385ec6f45faec6cc2'
  '72bd6d21c0e88da2f76e767d5cc3b4e4b5c0e0143a44b0107832b6c131d3d93a'
)

prepare() {
  cd python-plyfile
  patch -p0 -i "$srcdir/update_build_system.patch"
}

build() {
  cd python-plyfile
  python -m build --no-isolation --wheel
}

check() {
  cd python-plyfile
  python -m pytest
}

package() {
  cd python-plyfile
  python -m installer --destdir="$pkgdir" "dist/plyfile-$pkgver-"*.whl
}
