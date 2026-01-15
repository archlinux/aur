# Maintainer: piernov <piernov@piernov.org>

pkgname=python-spikingjelly-git
pkgver=r2253.75272ed9
pkgrel=1
pkgdesc="Deep learning framework for Spiking Neural Network (SNN) based on PyTorch."
arch=('any')
url="https://github.com/fangwei123456/spikingjelly"
license=('custom')
conflicts=('python-spikingjelly')
provides=('python-spikingjelly')
depends=('python-pytorch' 'python-matplotlib' 'python-numpy' 'python-tqdm' 'python-torchvision' 'python-scipy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("git+https://github.com/fangwei123456/spikingjelly.git")
md5sums=('SKIP')


pkgver() {
  cd "$srcdir"/spikingjelly
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/spikingjelly
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/spikingjelly
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
