# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Duru Can Celasun <can at dcc dot im>
pkgname=pymdown-extensions
pkgver=10.2
pkgrel=2
pkgdesc="Extensions for Python Markdown"
arch=('any')
url="https://facelessuser.github.io/pymdown-extensions"
license=('MIT')
depends=('python-markdown' 'python-pyaml')
makedepends=('python-build' 'python-hatchling' 'python-installer'
             'python-packaging' 'python-wheel')
optdepends=('python-pygments: syntax highlighting')
checkdepends=('python-pygments' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::https://github.com/facelessuser/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('7add745c035e8fc4a41d01bb2f86af4abb6cb50a25c69a13e49873bd6086db57')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  python run_tests.py
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
