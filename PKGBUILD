# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-taskipy
_pkgname="${pkgname#python-}"
pkgver=1.9.0
pkgrel=1
pkgdesc="The complementary task runner for Python"
arch=('any')
url="https://github.com/illBeRoy/taskipy"
license=('MIT')
depends=('python' 'python-toml' 'python-psutil' 'python-colorama')
makedepends=('python-build' 'python-poetry' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('2127eb4f9d15bd6d30769322d8e7e9b441030bc784eb889d69037cb4a50b8eff788254cc4b6f8b88d0a529c48963be0185f1a4b960ee01a68d019797523a6304')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"

  PIP_CONFIG_FILE=/dev/null pip install \
    --isolated \
    --root="$pkgdir" \
    --ignore-installed \
    --no-deps \
    dist/*.whl

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
