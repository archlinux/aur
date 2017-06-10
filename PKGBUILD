# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=python-fafclient
pkgver=0.12.5.33.g9d446816
pkgrel=1
epoch=0
pkgdesc="Forged Alliance Forever - Lobby Client. Community-driven client system for Supreme Commander: Forged Alliance."
url="http://www.faforever.com/"
arch=('any')
license=('GPL3')
groups=()
depends=('python-pyqt5' 'python-ipaddress' 'python-py' 'python-pycparser' 'python-dateutil' 'python-requests' 'python-lupa' 'python-trueskill' 'python-cffi' 'python-marshmallow-jsonapi' 'python-semantic-version' 'python-faftools' 'lib32-libpulse' 'wine>1.6.0' 'xdelta3' 'faf-uid' 'faf-res')
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/FAForever/client.git#branch=474-feature-py3" 'FAForeverPy36.desktop')
sha256sums=('SKIP'
            '460f1d4d4e7a94f5c2c4f5d1e92014a97f63cc3512a019e4206e1b85ad57b544')
noextract=()
validpgpkeys=()

pkgver() {
  cd "client"
  git describe --tags | sed -e 's/-/./g'
}
prepare() {
  cd "client"
  mv src fafclient
}

build() {
  cd "client"
  FAFCLIENT_VERSION=$pkgver python setup.py build
}

package() {
  cd "client"
  FAFCLIENT_VERSION=$pkgver python setup.py install --root="$pkgdir" --optimize=1 
  install -D "$srcdir/FAForeverPy36.desktop" "$pkgdir/usr/share/applications/FAForeverPy36.desktop"
}
