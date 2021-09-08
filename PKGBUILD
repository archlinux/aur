# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-taskipy
_pkgname="${pkgname#python-}"
pkgver=1.8.2
pkgrel=1
pkgdesc="The complementary task runner for Python"
arch=('any')
url="https://github.com/illBeRoy/taskipy"
license=('MIT')
depends=('python' 'python-toml' 'python-psutil' 'python-colorama')
makedepends=('python-poetry' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('564592d0ecdfc84d74010be42c1eff7e2a3de0c891ad588d93975d28747066241f2e9a8e038b019e80d6f727d2cf5ac51d9f07062b465b3d5f87cc932290e455')

build() {
  cd "$_pkgname-$pkgver"
  poetry build --format wheel
}

package() {
  cd "$_pkgname-$pkgver"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
