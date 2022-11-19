# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-execnet
pkgver=1.9.0
pkgrel=4
pkgdesc="Rapid multi-Python deployment"
arch=('any')
license=('MIT')
url="https://codespeak.net/execnet"
depends=('python38')
makedepends=('python38-setuptools-scm')
checkdepends=('python38-pytest-timeout' 'procps-ng' 'openssh')
source=("https://pypi.io/packages/source/e/execnet/execnet-$pkgver.tar.gz")
sha512sums=('d425e7b6f3708efecb5dfa2c36a837cb55f2c32cf2ec0c1dc11cd1ca6ea614d119d04908b84dd5a3593c87db35e71fee202f843665c853ac3538479f60c83d60')

build() {
  cd "$srcdir"/execnet-$pkgver
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/execnet-$pkgver
  PYTHONPATH="$PWD/build/lib:$PYTHONPATH" pytest testing
}

package() {
  cd execnet-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
