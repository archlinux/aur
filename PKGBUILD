# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-flake8-pytest-style
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=1.5.0
pkgrel=1
pkgdesc="A flake8 extension that checks issues with pytest tests"
arch=('any')
url="https://github.com/m-burst/flake8-pytest-style"
license=('MIT')
depends=('python' 'flake8' 'python-flake8-plugin-utils')
makedepends=('python-pip' 'python-poetry')
checkdepends=('python-pytest-deadfixtures')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('7e48abc6ec45fde6a59e37cf77015cb640629a2af97bea7976e073457e97f59594d0cdd268119053433083af03f3756709b485dee4674ea3ada4bfc4811803c4')

build() {
  cd "$_pkgname-$pkgver"
  poetry build --format wheel
}

check() {
  cd "$_pkgname-$pkgver"
  pytest
}

package() {
  cd "$_pkgname-$pkgver"
  PIP_CONFIG_FILE=/dev/null pip \
    install \
    --isolated \
    --root="$pkgdir" \
    --ignore-installed \
    --no-deps \
    dist/*.whl

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
