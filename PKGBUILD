# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=rebound
_name="$pkgname-cli"
pkgver=2.1.0
pkgrel=2
pkgdesc="Command-line tool that instantly fetches Stack Overflow results when an exception is thrown"
arch=('any')
url="https://github.com/shobrook/rebound"
license=('MIT')
depends=('python-beautifulsoup4' 'python-requests' 'python-urwid')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('19e2065a140a64abb53d8553b6faa15db89a851e9909225786cb6997e56c03c7')

prepare() {
  cd "$_name-$pkgver"

  # Correct version
  sed -i "s/V1.1.9a1/V$pkgver/g" "$pkgname/$pkgname.py"
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
