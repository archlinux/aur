# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-iocapture
pkgver=0.1.2
pkgrel=11
pkgdesc="Capture stdout, stderr easily"
arch=('any')
license=('MIT')
url="https://github.com/oinume/iocapture"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-flexmock' 'python-pytest-cov' 'python-six')
source=("https://github.com/oinume/iocapture/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1205d13b107d83dcb45d5546038d8b0b5417a20a51149c405123111488c351ff81a447f10653cd3dd9ecc236e01a0fcceb6647091e38ff2fa34c69e0baff1567')

build() {
  cd iocapture-$pkgver
  python setup.py build
}

check() {
  cd iocapture-$pkgver
  python setup.py pytest
}

package() {
  cd iocapture-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
