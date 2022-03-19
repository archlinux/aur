# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-caerus
pkgdesc='Detection of favorable moments in time series data'
pkgver=0.1.7
pkgrel=1
url='https://github.com/erdogant/caerus'
arch=('any')
license=('MIT')
depends=('python-matplotlib' 'python-numpy' 'python-pandas' 'python-tqdm')
makedepends=('python-setuptools')

_pypi=caerus
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
  'https://erdogant.github.io/datasets/facebook_stocks.zip'
  'https://erdogant.github.io/datasets/BTCUSDT.zip'
  'include_example_datasets.patch'
)
sha256sums=(
  '304c32ba9da8a17abb0d42f574fd2a6d07607a675a2a336cc325fd05c566c42d'
  '1c57af47f4ae1796643cfd654be48d87729061616ea909bd2c4b48a0c209b892'
  '080a583e30cb5fd695e195e8d7b1a65ebf44d396f61e2b124e53a04f42e9a0aa'
  'b4e28c044c9f5c603423da7e75d017500955490b7efcd9175de61d0c8e74eaee'
)

prepare() {
  cd "$_pypi-$pkgver"
  patch -p0 -i "$srcdir/include_example_datasets.patch"
}

build() {
  cd "$_pypi-$pkgver"
  python setup.py build
}

package() {
  cd "$_pypi-$pkgver"
  python setup.py install --skip-build --optimize=1 --prefix=/usr --root="$pkgdir"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  cd "$srcdir"
  install -Dm644 -t "$pkgdir/usr/share/$pkgname" fb.csv BTCUSDT/BTCUSDT.csv
}
