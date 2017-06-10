# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=python2-fafclient-icetest
pkgver=0.12.5.15.g8d1467b5
pkgrel=1
epoch=0
pkgdesc="Forged Alliance Forever - Lobby Client. Community-driven client system for Supreme Commander: Forged Alliance."
url="http://www.faforever.com/"
arch=('any')
license=('GPL3')
groups=()
depends=('python2-pyqt4>=4.0.0' 'python2-ipaddress' 'python2-enum34' 'python2-pathlib' 'python2-py' 'python2-pycparser' 'python2-dateutil' 'python2-requests' 'python2-lupa' 'python2-trueskill' 'python2-cffi' 'python2-marshmallow-jsonapi' 'python2-faftools' 'python2-semantic-version' 'lib32-libpulse' 'wine>1.6.0' 'xdelta3' 'faf-uid' 'faf-ice-adapter>=5.2.0' 'faf-res')
makedepends=('python2-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=('')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/FAForever/client.git#branch=feature/ice-adapter" 'FAForeverPy27ICE.desktop')
sha256sums=('SKIP'
            'e6d23880c68cbe37b046823daa6b977c8ca3fe553d823aefec196bfa388a9132')
noextract=()
validpgpkeys=()

pkgver() {
  cd "client"
  git describe --tags | sed -e 's/-/./g'
}

prepare() {
  cd "client"
  mv src fafclientice
}

build() {
  cd "client"
  FAFCLIENT_VERSION=$pkgver python2 setup.py build
}

package() {
  cd "client"
  FAFCLIENT_VERSION=$pkgver python2 setup.py install --root="$pkgdir" --optimize=1 
  install -D "$srcdir/FAForeverPy27ICE.desktop" "$pkgdir/usr/share/applications/FAForeverPy27ICE.desktop"
}
