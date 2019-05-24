# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-black
pkgver=0.3.5
pkgrel=1
pkgdesc="A pytest plugin to enable format checking with black"
arch=('any')
license=('MIT')
url="https://github.com/shopkeep/pytest-black/"
depends=('python-black' 'python-pytest')
makedepends=('python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shopkeep/pytest-black/archive/$pkgver.tar.gz")
sha512sums=('a1ab8d7db5fa01539d308d77619284708c206c92174349c60a8fd74f345fb9934566800c0fb0344fb8a5628cffcdb9cdaad5531f03914a8031a8b3d290188b89')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd pytest-black-$pkgver
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-black-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.7/site-packages:$PYTHONPATH:$PWD/tests" py.test
}

package() {
  cd pytest-black-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
