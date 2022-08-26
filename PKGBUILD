# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-green
pkgver=3.4.2
pkgrel=1
pkgdesc="Green is a clean, colorful, fast python test runner"
url="https://github.com/CleanCut/green"
license=('MIT')
arch=('any')
depends=('python-colorama' 'python-coverage' 'python-unidecode' 'python-lxml')
makedepends=('python-setuptools')
checkdepends=('python-django' 'python-testtools')
source=("https://github.com/CleanCut/green/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b0a2d0c846cca56d65b6c65160bc09fa6ebeee9613e6a459fd76bcfa91ffb4062256858e287f78b728339473d293e21472b62089200def9037da1249bc64f2c4')

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
