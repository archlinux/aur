# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Morten Linderud <morten@linderud.pw>

pkgname=python-pychromecast
_name=${pkgname#python-}
pkgver=3.0.0
pkgrel=2
pkgdesc='Library for Python 3 to communicate with the Google Chromecast'
arch=('any')
url=https://github.com/balloob/pychromecast
license=('MIT')
depends=('python' 'python-protobuf' 'python-requests' 'python-zeroconf' 'python-six' 'python-setuptools' 'python-casttube')
makedepends=('python-setuptools')
source=("https://github.com/balloob/pychromecast/archive/$pkgver.tar.gz"
        "version.patch")
sha512sums=('120c58aecd3863420ab9fa0c7f7203a78dabcd1ebcce60390ae70d036d4812a55ae909f134d10aa5b8449ca5222bb6a09b382e73fadb1d32ba099400d35a73bd'
            '009dcecd2eb543c7500e33b366f2a92b0339beeb92be330de8f9f6c33c38db883a6f187c912163f3f24636c8f3a810596a4b6e64fae563e7c71159f5b160e57e')

prepare() {
  cd "$_name-$pkgver"
  patch --forward --strip=1 --input="$srcdir/version.patch"
}

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
