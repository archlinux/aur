# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-h2
pkgver=4.1.0
pkgrel=1
pkgdesc="HTTP/2 State-Machine based protocol implementation"
arch=('any')
license=('MIT')
url="https://hyper.rtfd.org"
depends=('python38-hpack' 'python38-hyperframe')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner' 'python38-hypothesis')
source=("https://github.com/python-hyper/h2/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('4e9cf88b3ae702a8a42bded775ad337809787fe8172d501c230d55abbf1edd764acf3b227f2e58756d882499661ffcf6bbdd4812a4d938c04fac3f1aa2390b28')

build() {
  cd h2-$pkgver
  python3.8 setup.py build
}

check() {
  cd h2-$pkgver
  python3.8 setup.py pytest
}

package() {
  cd h2-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
