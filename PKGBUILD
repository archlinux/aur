# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: Stunts <f.pinamartins@gmail.com>

pkgname=hangups
pkgver=0.4.5
pkgrel=1
pkgdesc='The first third-party instant messaging client for Google Hangouts'
arch=('any')
url=https://github.com/tdryer/hangups
license=('MIT')
depends=('python-aiohttp' 'python-appdirs' 'python-configargparse'
         'python-mechanicalsoup' 'python-protobuf' 'python-readlike'
         'python-reparser' 'python-requests' 'python-urwid')
source=("https://files.pythonhosted.org/packages/source/h/hangups/hangups-$pkgver.tar.gz"
        "hangups-$pkgver.license::https://raw.githubusercontent.com/tdryer/hangups/v$pkgver/LICENSE")
sha512sums=('e074f6b4243268b56e840f094083a3ed79c91509f28d372b21f19b28052b14e3ab0858fed17d36996752ae09c23903fdd029e7fad80024313a9e223e3f13a06f'
            '6a0e0c135e55f027e3817ce181c7f5d73a3fd6f4c1ebe6bb28ab61352eeecdf1acdea78178ae6fe1eae8632d99e16e85c973e403644b7eac77c62dfc6c21eae9')

prepare() {
  cd hangups-$pkgver
  sed -i 's/==/>=/g' setup.py
  sed -i 's/protobuf>=3.1.0,<3.2.0/protobuf>=3.1.0/' setup.py
}

build() {
  cd hangups-$pkgver
  python setup.py build
}

package() {
  cd hangups-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ../hangups-$pkgver.license "$pkgdir"/usr/share/licenses/hangups/LICENSE
}

# vim:set ts=2 sw=2 et:
