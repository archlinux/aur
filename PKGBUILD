# Contributor: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

# Based on python-jsonpointer in [community]

_name=jsonpointer
pkgname=python2-$_name
pkgver=2.1
pkgrel=1
pkgdesc='Identify specific nodes in a JSON document (RFC 6901)'
arch=('any')
url='https://github.com/stefankoegl/python-json-pointer'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('4eed8c7fa908ce3ca79884e98b1b0e818d24515f6b7b2067daa49ab6dbd989be4bc43f387e980773c9fc17bca89d2039750cb0df76675259050e3f48c16da3b6')

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
