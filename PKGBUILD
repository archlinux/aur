# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Duru Can Celasun <can at dcc dot im>
pkgname=pymdown-extensions
pkgver=10.8.1
pkgrel=1
pkgdesc="Extensions for Python Markdown"
arch=('any')
url="https://facelessuser.github.io/pymdown-extensions"
license=('MIT')
depends=(
  'python-markdown'
  'python-pyaml'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-packaging'
  'python-wheel'
)
optdepends=(
  'python-pygments: syntax highlighting'
)
checkdepends=(
  'python-pygments' 'python-pytest-cov'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/facelessuser/pymdown-extensions/archive/$pkgver.tar.gz")
sha256sums=('bada823efb9660a2ecb4036d77e053a0353d0adcbe6e175a497afd67a97c3a1d')

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
