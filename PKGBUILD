# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=rebound
_name="$pkgname-cli"
pkgver=2.1.0
pkgrel=1
pkgdesc="Command-line tool that instantly fetches Stack Overflow results when an exception is thrown"
arch=('any')
url="https://github.com/shobrook/rebound"
license=('MIT')
depends=('python-beautifulsoup4' 'python-requests' 'python-urwid')
makedepends=('python-setuptools')
#checkdepends=('python-pytest')
#source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('19e2065a140a64abb53d8553b6faa15db89a851e9909225786cb6997e56c03c7')

prepare() {
  cd "$_name-$pkgver"

  # Correct version
  sed -i "s/V1.1.9a1/V$pkgver/g" "$pkgname/$pkgname.py"
}

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

#check() {
#  cd "$_name-$pkgver"
#  pytest
#}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
