# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-mako
pkgver=1.2.4
pkgrel=1
pkgdesc="A super-fast templating language that borrows the best ideas from the existing templating languages"
arch=('any')
url="https://www.makotemplates.org/"
license=('MIT')
depends=('python38-markupsafe')
makedepends=('python38-setuptools')
# python38-lingua isn't packaged
checkdepends=('python38-pytest' 'python38-babel' 'python38-beaker' 'python38-dogpile.cache'
              'python38-pygments')
source=("https://pypi.io/packages/source/M/Mako/Mako-$pkgver.tar.gz"{,.asc})
sha512sums=('9a90d245f2c8b5e5efa283d91f762a2fffa40b7f71e7a4b66de7f66f894ad5ba2fa5c04080200b6633bb61d4308db5b5e763b26ae7d93d18efe4aebb2178006a'
            'SKIP')
validpgpkeys=('83AF7ACE251C13E6BB7DEFBD330239C1C4DAFEE1'   # Michael Bayer
              '2CA9B722133AF20453401FD1A33AC2044BFDF51E')  # Mako Maintainer

build() {
  cd Mako-$pkgver
  python3.8 setup.py build
}

check() {
  cd Mako-$pkgver
  python3.8 -m pytest
}

package() {
  cd Mako-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
