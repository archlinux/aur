# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-green
pkgver=3.4.3
pkgrel=1
pkgdesc="Green is a clean, colorful, fast python test runner"
url="https://github.com/CleanCut/green"
license=('MIT')
arch=('any')
depends=('python-colorama' 'python-coverage' 'python-unidecode' 'python-lxml')
makedepends=('python-setuptools')
checkdepends=('python-django' 'python-testtools')
source=("https://github.com/CleanCut/green/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ded7e7bfbccbd19d2ff0a87e12774c36bfd14b1a25bc2c65b2aa6f1a6e19af12f6f38c046097516ed6fb3675287dc9fe2be73718fd12fdaa160cda15b8952baa')

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
