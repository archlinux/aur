# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-iniconfig
pkgver=1.1.1
pkgrel=5
pkgdesc="brain-dead simple config-ini parsing"
url="https://github.com/RonnyPfannschmidt/iniconfig"
license=('MIT')
arch=('any')
makedepends=('python38-setuptools' 'python38-setuptools-scm')
checkdepends=('python38-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RonnyPfannschmidt/iniconfig/archive/v$pkgver.tar.gz")
sha512sums=('3e86490e424adefcc36b498ed0e6c6a6d4c6a2804a95b99163cef456f303b1913e9afe34035039cf0f2e96f7624719dc85e4ab3917ccd59278b22894a00dbf26')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd "$srcdir"/iniconfig-$pkgver
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/iniconfig-$pkgver
  python3.8 setup.py pytest
}

package() {
  cd iniconfig-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  python3.8 -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
