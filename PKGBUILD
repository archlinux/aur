# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

# Based on python-jsonpatch in [community]

_urlname=python-json-patch
pkgname=python2-jsonpatch
pkgver=1.25
pkgrel=2
pkgdesc='An implementation of the JSON Patch format'
arch=('any')
url="https://github.com/stefankoegl/$_urlname"
license=('BSD')
depends=('python2-jsonpointer')
makedepends=('python2-setuptools' 'python2-pypandoc')
checkdepends=('python2-coverage')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5e1d5b6dcb6ee847ddd561400fe2d00e07aa1827a63ab98a38cd5e91fa0e52d8635eba1192edbccf9c7b9ce9c7ce0a414d580665c427c87a820e533d26092ad6')

prepare(){
  find $_urlname-$pkgver -name \*.py -exec sed -i '1s/python$/&2/' {} +
}

build() {
  cd $_urlname-$pkgver

  python2 setup.py build
}

check() {
  cd $_urlname-$pkgver

  coverage2 run --source=jsonpatch tests.py
}

package() {
  cd $_urlname-$pkgver

  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  for _bin in "$pkgdir"/usr/bin/*; do
    mv "$_bin"{,2}
  done
}
