# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-vcrpy
pkgver=4.2.1
pkgrel=2
pkgdesc='Automatically mock your HTTP interactions to simplify and speed up testing'
arch=('any')
license=('MIT')
url='https://github.com/kevin1024/vcrpy'
depends=('python38-yaml' 'python38-wrapt' 'python38-six' 'python38-yarl')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner' 'python38-pytest-httpbin')
source=("https://github.com/kevin1024/vcrpy/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('59231e5164cda3099b18d099f0ef97e062e6401e52e5dfc4022aa89ca02881e9e6e3c782f12c288f5281b3b3bf175dc33a267bc6d2b40791582a1221f5d7aaab')

build() {
  cd vcrpy-$pkgver
  python3.8 setup.py build
}

check() {
  cd vcrpy-$pkgver
  python3.8 setup.py pytest
}

package() {
  cd vcrpy-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
