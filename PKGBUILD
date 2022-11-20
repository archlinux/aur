# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-configupdater
pkgver=3.1.1
pkgrel=1
pkgdesc="Parser like ConfigParser but for updating configuration files"
url="https://github.com/pyscaffold/configupdater"
license=('MIT')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools-scm')
checkdepends=('python38-pytest-cov')
source=("https://github.com/pyscaffold/configupdater/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1e499f87d0ac3d75f32aafe532d7c83b4b86fbaa204fcdbaf7a3dcb5262d936fe027ee0b21d169ef69a0590edbe965a872390b14be274fbb1c893f2d4695b92c')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd configupdater-$pkgver
  python3.8 setup.py build
}

check() {
  cd configupdater-$pkgver
  PYTHONPATH="$PWD"/build/lib pytest
}

package() {
  cd configupdater-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
