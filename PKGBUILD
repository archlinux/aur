# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Duru Can Celasun <can at dcc dot im>
pkgname=pymdown-extensions
_name=pymdown_extensions
pkgver=10.1
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
sha256sums=('508009b211373058debb8247e168de4cbcb91b1bff7b5e961b2c3e864e00b195')

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
