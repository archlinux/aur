# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Duru Can Celasun <can at dcc dot im>
pkgname=pymdown-extensions
_name=pymdown_extensions
pkgver=9.11
pkgrel=1
pkgdesc="Extensions for Python Markdown"
arch=('any')
url="https://facelessuser.github.io/pymdown-extensions"
license=('MIT')
depends=('python-markdown' 'python-pyaml')
makedepends=('python-build' 'python-hatchling' 'python-installer'
             'python-packaging' 'python-wheel')
optdepends=('python-pygments: syntax highlighting')
checkdepends=('python-pygments' 'python-pytest-cov')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
#source=("$_name-$pkgver.tar.gz::https://github.com/facelessuser/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('f7e86c1d3981f23d9dc43294488ecb54abadd05b0be4bf8f0e15efc90f7853ff')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python run_tests.py
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
