# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Stunts <f.pinamartins@gmail.com>

pkgname=hangups
pkgver=0.4.2
pkgrel=1
pkgdesc='The first third-party instant messaging client for Google Hangouts'
arch=('any')
url=https://github.com/tdryer/hangups
license=('MIT')
depends=('python-aiohttp' 'python-appdirs' 'python-configargparse'
         'python-mechanicalsoup' 'python-protobuf' 'python-readlike'
         'python-reparser' 'python-requests' 'python-urwid')
checkdepends=('python-httpretty' 'python-pytest')
source=("hangups-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('0d4cd5a8faba66108193e17134c4d6c162a5904cee768dbad8d76852f6c2c198903a75912786c85da56016cad0c0e86086eea7f7622641d4ae3a9fb38a3a46d4')

prepare() {
  cd hangups-$pkgver
  sed -i 's/==/>=/g' setup.py
  sed -i 's/protobuf>=3.1.0,<3.2.0/protobuf>=3.1.0/' setup.py
  sed -i 's/aiohttp>=1.2,<1.3/aiohttp>=1.2/' setup.py
}

build() {
  cd hangups-$pkgver
  python setup.py build
}

check() {
  cd hangups-$pkgver
  pytest hangups
}

package() {
  cd hangups-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
