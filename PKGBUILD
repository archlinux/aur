# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: Victor Häggqvist <aur@snilius.com>

pkgname=rainbowstream
pkgver=1.3.8
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
source=(
${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/d1/ff/3bba3e1b21c6892c859f06c62c1c183d8ac129d1cb8bfbed0336f88ba9a9/${pkgname}-${pkgver}.tar.gz
setup.py.patch
rainbow.py.patch)
sha512sums=('3a4925e3b4023271fa1b6ee8fb16229281f653b64e505599a5fdb4c5323358be5c2bcc1da606df6481c81d9dca8ceef1297399c439eb0ffa20364cf3c9835f28'
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
