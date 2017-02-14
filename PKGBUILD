# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=python2-fafclient-icetest
pkgver=0.12.2
pkgrel=2
epoch=0
pkgdesc="Forged Alliance Forever - Lobby Client. Community-driven client system for Supreme Commander: Forged Alliance."
url="http://www.faforever.com/"
arch=('any')
license=('GPL3')
groups=()
depends=('python2-pyqt4>=4.0.0' 'python2-ipaddress' 'python2-enum34' 'python2-pathlib' 'python2-py' 'python2-pycparser' 'python2-dateutil' 'python2-requests' 'python2-bsdiff4' 'python2-lupa' 'python2-trueskill' 'python2-cffi' 'python2-marshmallow-jsonapi' 'python2-faftools' 'python2-semantic-version' 'lib32-libpulse' 'wine>1.6.0' 'xdelta3' 'faf-uid' 'faf-ice-adapter>=5.1.3')
makedepends=('python2-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=('python2-fafclient')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://codeload.github.com/FAForever/client/zip/feature/ice-adapter" 'FAForever.desktop')
sha256sums=('4ba087b26f068e183497c3ae9c43e05bad398017c674ece8670f1be3097693c6'
            'f503475daa227d4ce1fa66063b065db7375ce3c0d161d77e3c2bd19c65468cbc')
noextract=()
validpgpkeys=()

prepare() {
  cd "client-feature-ice-adapter"
  mv src fafclient
}

build() {
  cd "client-feature-ice-adapter"
  FAFCLIENT_VERSION=$pkgver python2 setup.py build
}

package() {
  cd "client-feature-ice-adapter"
  FAFCLIENT_VERSION=$pkgver python2 setup.py install --root="$pkgdir" --optimize=1 
  mkdir -p "$pkgdir/usr/share"
  cp -r "res" "$pkgdir/usr/share/fafclient"
  echo "$pkgver" > "$pkgdir/usr/share/fafclient/RELEASE-VERSION"
  install -D "$srcdir/FAForever.desktop" "$pkgdir/usr/share/applications/FAForever.desktop"
}
