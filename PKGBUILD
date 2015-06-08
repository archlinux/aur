# Contributor: Jameson Pugh <imntrealgmail.com>
# Contributor: André-Nam Berger <andrenam.berger@googlemail.com>
# Maintainer: Jameson Pugh <imntrealgmail.com>

pkgname=fogger-bzr
pkgver=225
pkgrel=1
pkgdesc="bzr version of fogger web app to desktop app"
arch=('i686' 'x86_64')
url="http://launchpad.net/fogger"
license=('GPL')
depends=('python2-requests' 'desktop-file-utils' 'python2-xlib' 'python2-beautifulsoup3' 'python2-simplejson')
makedepends=('bzr' 'python2-distutils-extra')
conflicts=('fogger')
replaces=('fogger')
install=fogger-bzr.install
source=('fogger::bzr+http://bazaar.launchpad.net/~loneowais/fogger/trunk/'
  'rmlibunity.patch')
sha256sums=('SKIP'
  '72c4a5e455e3c5e12bc548df8646433d536517a64b1aa078f81a0b0db4a98f7a')

pkgver() {
  cd fogger
  bzr revno
}

build() {
  cd "${srcdir}/fogger"

  patch -p1 < ../rmlibunity.patch
  python2 setup.py build
}

package() { 
  cd "${srcdir}/fogger"

  python2 setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
