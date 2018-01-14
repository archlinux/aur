# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: Stunts <f.pinamartins@gmail.com>

pkgname=hangups
pkgver=0.4.4
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
sha512sums=('fee1dfce02d2cddfb6cba1e5a71d67a53732d2edb98d224289a5cd6da1d2cc246a9a4744501594cf91dd3b971b55eca96d4bb7c968bd7e2ff70b3e3f7f1d365d')

prepare() {
  cd hangups-$pkgver
  sed -i 's/==/>=/g' setup.py
  sed -i 's/protobuf>=3.1.0,<3.2.0/protobuf>=3.1.0/' setup.py
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
