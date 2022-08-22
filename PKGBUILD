# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-green
pkgver=3.4.1
pkgrel=1
pkgdesc="Green is a clean, colorful, fast python test runner"
url="https://github.com/CleanCut/green"
license=('MIT')
arch=('any')
depends=('python-colorama' 'python-coverage' 'python-unidecode' 'python-lxml')
makedepends=('python-setuptools')
checkdepends=('python-django' 'python-testtools')
source=("https://github.com/CleanCut/green/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b9c3e6d3333ef1f665f77567bc867992e4d80987fb875a36934a3287644c8779933bf9f1ed667dd326e3d6793bce81bc66ce6ccb767474b19671456c32cd83aa')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd green-$pkgver
  python setup.py build
}

check() {
  cd green-$pkgver
  ./g 3 -r -vvvv green
}

package() {
  cd green-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
