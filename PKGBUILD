# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-flake8-pytest-style
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=1.6.0
pkgrel=1
pkgdesc="A flake8 extension that checks issues with pytest tests"
arch=('any')
url="https://github.com/m-burst/flake8-pytest-style"
license=('MIT')
depends=('python' 'flake8' 'python-flake8-plugin-utils')
makedepends=('python-build' 'python-install' 'python-poetry-core')
checkdepends=('python-pytest-deadfixtures')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6d66d75b3e94974ea5a45e688ecc96b74f9a3187f0aefef542747e54d534a783093f08d165d01ba6ea6bdef07e45d3aeaeb9799945be38b7921c5e8e51ea5b30')
b2sums=('a14b01eb397de0c35dc55aaecdda661b271418538161f4955c0daffeceb89e4ba24fa8b16c7c4b856f10059172873b303a0c76ccf651459eaf58f4ecd683adb7')

build() {
  cd "$_pkgname-$pkgver"
  python \
    -m build \
    --wheel \
    --skip-dependency-check \
    --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  pytest
}

package() {
  cd "$_pkgname-$pkgver"

  python -m install \
    --optimize=1 \
    --destdir="$pkgdir" \
    dist/*.whl

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
