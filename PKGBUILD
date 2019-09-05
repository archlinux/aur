# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: David Thurstenson <thurstylark@gmail.com>
pkgname=chirp-hg-py3
pkgver=r3248.1da5155c5504
pkgrel=1
pkgdesc="GUI tool for programming ham radios, built from unstable python3 branch"
arch=('any')
url="http://chirp.danplanet.com/"
license=('GPL3')
depends=('python-lxml' 'python-pyserial' 'python-future' 'python-gobject' 'curl')
optdepends=('hamradio-menus: XDG menus for ham radio software')
makedepends=('mercurial')
provides=('chirp')
conflicts=('chirp')
source=('hg+http://d-rats.com/hg/chirp.hg#branch=py3')
md5sums=('SKIP')

# https://chirp.danplanet.com/projects/chirp/wiki/Linux_Python3

pkgver() {
  cd chirp.hg
  hg tip --template 'r{rev}.{node|short}'
}

prepare() {
  cd chirp.hg
  sed -i 's|/usr/sbin|/usr/bin|' setup.py
  # catches most of the remaining issues
  2to3 -w chirp/drivers/*.py
}

package() {
  cd chirp.hg
  python3 setup.py install --root="$pkgdir" --optimize=0
}

