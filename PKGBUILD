# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: Victor Häggqvist <aur@snilius.com>

pkgname=rainbowstream
pkgver=1.4.0
pkgrel=1
pkgdesc="A smart and nice Twitter client on terminal"
url="http://www.rainbowstream.org/"
license=('MIT')
arch=('any')
depends=(
'python'
'python-dateutil'
'python-arrow'
'python-requests'
'python-pyfiglet'
'python-twitter'
'python-pillow'
'python-pysocks'
'python-pocket')
makedepends=('python-setuptools')
provides=('rainbowstream')
conflicts=('rainbowstream')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
setup.py.patch
rainbow.py.patch)
sha512sums=('a07dd123b791e1dd2ca8333d38497f8322b9f0d0594b269f8e3add170b4799dd568153b40eefbf16eefbe2b7f43335f1c7b95d8ca1c8e9fa6cff032e6c5b9d2f'
            'd5203f37697dbff3fe745fa4a0236dd22f5565c833e3dd17e3c762706ab8b2758e6b56d2147e021c7ccb370f1bc97fb42cae602a3fc31213af03b1482fca5a9b'
            '4298b90e5f34228e09a52910738c393da6f5c350c43dabe367ffb9ac5efea64b56e80da9c46044d7ddd2145fb440efcbeb3b75d4bffc9067d39d573279070821')

build() {
  cd "$srcdir/rainbowstream-${pkgver}/rainbowstream"
  patch -i ../../rainbow.py.patch
  cd "$srcdir/rainbowstream-${pkgver}"
  patch -i ../setup.py.patch
  python setup.py build
}

package() {
  cd "$srcdir/rainbowstream-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sts=2 sw=2 et ft=PKGBUILD
