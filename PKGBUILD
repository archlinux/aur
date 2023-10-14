# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=tensorboardX
pkgname=python-tensorboardx-git
pkgver=2.5.1.r36.g092fcb0
pkgrel=1
pkgdesc="Tensorboard for PyTorch"
arch=('any')
url="https://github.com/lanpa/tensorboardX"
license=('MIT')
depends=(
    'python-numpy'
    'python-protobuf'
    )
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools-scm'
    'python-wheel'
    )
optdepends=(
    'python-crc32c: speed up'
    'python-soundfile: 200x speed up the add_audio() function'
    )
provides=('python-tensorboardx')
conflicts=('python-tensorboardx')
source+=("git+https://github.com/lanpa/tensorboardX.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | \
	  sed 's/^v//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_name"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
