# Maintainer: Sauyon Lee <aur@sauyon.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Stunts <f.pinamartins@gmail.com>

pkgname=hangups
pkgver=0.4.9
pkgrel=1
pkgdesc='The first third-party instant messaging client for Google Hangouts'
arch=('any')
url=https://github.com/tdryer/hangups
license=('MIT')
depends=('python-aiohttp' 'python-appdirs' 'python-configargparse'
         'python-mechanicalsoup' 'python-protobuf' 'python-readlike'
         'python-reparser' 'python-requests' 'python-setuptools' 'python-urwid')
source=("https://files.pythonhosted.org/packages/source/h/hangups/hangups-$pkgver.tar.gz")
sha512sums=('6a72b77e412cab79b6821f31b50cce6f5546d7e2a4bce66988207b148d09081b8b5d3fed8684d95722ddc2788fd5e24c0cf362a9ff7bf3f30dbc4066fe2f3624')

prepare() {
  cd hangups-$pkgver
  sed -i 's/==/>=/g' setup.py
}

build() {
  cd hangups-$pkgver
  python setup.py build
}

package() {
  cd hangups-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/hangups LICENSE
}

# vim:set ts=2 sw=2 et:
