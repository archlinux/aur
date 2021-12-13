# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-flake8-plugin-utils
_pkgname="${pkgname#python-}"
pkgver=1.3.2
pkgrel=2
pkgdesc="Provides base classes and utils for flake8 plugin writing"
arch=('any')
url="https://github.com/afonasev/flake8-plugin-utils"
license=('MIT')
depends=('python' 'flake8')
makedepends=('python-pip' 'python-poetry')
checkdepends=('python-pytest-deadfixtures' 'python-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('344fbdad54078b911408c2b76c69adcef4182408ad1de8d8b46e92d0e50f8a72fd7f46161326bb6da101c9f51a2223b05af3d200666655a5d9258c3fa7c23180')

prepare() {
  cd "$_pkgname-$pkgver"
}

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
