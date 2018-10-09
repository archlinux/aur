# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=tensorboardX
pkgname=python-tensorboardx-git
pkgver=1.2.r90.gddca1a9
pkgrel=1
pkgdesc="Tensorboard for PyTorch"
arch=('any')
url="https://github.com/lanpa/tensorboardX"
license=('MIT')
depends=('python-pytorch' 'python-torchvision' 'python-protobuf' 'python-six')
optdepends=('tensorboard: to visualise TensorBoard data')
provides=('python-tensorboardx')
conflicts=('python-tensorboardx')
makedepends=('python-setuptools')
source+=("git+https://github.com/lanpa/tensorboardX.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | \
	  sed 's/^v//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_name"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
