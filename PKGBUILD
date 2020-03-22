# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

# Based on python-jsonpointer in [community]

_name=jsonpointer
pkgname=python2-$_name
pkgver=2.0
pkgrel=5
pkgdesc='Identify specific nodes in a JSON document (RFC 6901)'
arch=('any')
url='https://github.com/stefankoegl/python-json-pointer'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('e8e2b03c12c3fc5f65816fc71d1c07135ef74a0c912286f5b8bef2d9e21b8ae6e766d1aa2104b3eeb0e53928034321f25b203386ac3f5641b54b0641f6a08137')

prepare(){
  find $_name-$pkgver -name \*.py -exec sed -i '1s/python$/&2/' {} +
}

build() {
  cd $_name-$pkgver

  python2 setup.py build
}

check() {
  cd $_name-$pkgver

  python2 tests.py
}

package() {
  cd $_name-$pkgver

  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  mv "$pkgdir"/usr/bin/jsonpointer{,2}
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
