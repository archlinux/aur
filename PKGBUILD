# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-glob2
pkgver=0.7
pkgrel=4
pkgdesc="Version of the glob module that can capture patterns and supports recursive wildcards"
url="https://github.com/miracle2k/glob2"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/miracle2k/python-glob2/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        $pkgname-warning.patch::https://github.com/miracle2k/python-glob2/pull/27.patch)
sha512sums=('dc547b16ab522306bb741c81020389d2c19beeeaa4d9ece74c878a4a6234689cf2372af9476369c8f406ff3d58a1fb3dcb7cc48d96a335eceef5c4a2863b67fe'
            '9d9fae98fbac70f4b639be9732512e6d4465553947371457feaacb73a7152f25171e98ce427494a4ac571d01da1fa1b3ddae4e15841c178d16b96918108cdde7')

prepare() {
  cd python-glob2-$pkgver
  patch -p1 -i ../$pkgname-warning.patch
}

build() {
  cd python-glob2-$pkgver
  python setup.py build
}

check() {
  cd python-glob2-$pkgver
  pytest test.py
}

package() {
  cd python-glob2-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
