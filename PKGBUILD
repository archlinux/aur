# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-calver
pkgver=2022.06.26
pkgrel=1
pkgdesc="Setuptools extension for CalVer package versions"
url="https://github.com/di/calver"
license=('Apache')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'python38-pretend')
source=("https://github.com/di/calver/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('4d436cead8930cae1a71eddef9f0ecd2881f8cb632c3814dc75390b061a909e7ca969a604a5fded1c66647947856d540e2180bd3ce4bed5087b4dbc9d5edb393')

prepare() {
  cd calver-$pkgver
  echo "Version: $pkgver" > PKG-INFO
}

build() {
  cd calver-$pkgver
  python3.8 setup.py build
}

check() {
  cd calver-$pkgver
  mv PKG-INFO PKG-INFO.bak
  PYTHONPATH="$PWD"/build/lib pytest
  mv PKG-INFO.bak PKG-INFO
}

package() {
  cd calver-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
