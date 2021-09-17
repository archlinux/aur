# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mnamer
pkgver=2.5.4
pkgrel=1
pkgdesc='A media organization tool'
arch=('any')
url='https://github.com/jkwill87/mnamer'
license=('MIT')
depends=(
  'python>=3.7'
  'python-appdirs<1.5'
  'python-appdirs>=1.4'
  # 'python-babelfish<0.6'
  'python-babelfish>=0.6'
  # 'python-guessit<3.3'
  'python-guessit>=3.2'
  'python-requests<3'
  'python-requests>=2'
  # 'python-requests-cache<0.6'
  'python-requests-cache>=0.6'
  'python-teletype<1.2'
  'python-teletype>=1.1'
  'python-wheel')
makedepends=('python-setuptools')
# checkdepends=('python-pytest-cov' 'python-pytest-rerunfailures')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8da5e1c0a6ecaa1fb60f7b472583de6a892e3b1f8cc0264a9c347e409c3dbc3b')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's/==/>=/g;/dataclasses/d' requirements.txt
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

# check() {
#   cd "$pkgname-$pkgver"
#   pytest
# }

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
# vim:set ts=2 sw=2 et:
