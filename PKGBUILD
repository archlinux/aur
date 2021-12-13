# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-flake8-pytest-style
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=1.5.1
pkgrel=2
pkgdesc="A flake8 extension that checks issues with pytest tests"
arch=('any')
url="https://github.com/m-burst/flake8-pytest-style"
license=('MIT')
depends=('python' 'flake8' 'python-flake8-plugin-utils')
makedepends=('python-build' 'python-poetry-core' 'python-pip')
checkdepends=('python-pytest-deadfixtures')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f961bf8d5c9391959dcb8615963937b824f11586de7c66306b4654e444ef28cb389966582b9daffb356747c58cae057964a7641204f58f3c6b2ede3af1deb1c3')
b2sums=('66fde40cb2f54954f2ca279c9dbedee1eb9942728ade58ea2943f698565b705cacd825e7002b3226d84deac5cf6a8ced1a54999fb1c6e24c2b9664053c1b2cf0')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
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
