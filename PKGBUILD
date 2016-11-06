# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=python2-fafclient-icetest
pkgver=0.11.60+577
pkgrel=1
epoch=0
pkgdesc="Forged Alliance Forever - Lobby Client. Community-driven client system for Supreme Commander: Forged Alliance."
url="http://www.faforever.com/"
arch=('any')
license=('GPL3')
groups=()
depends=('python2-pyqt4>=4.0.0' 'python2-ipaddress' 'python2-enum34' 'python2-pathlib' 'python2-py' 'python2-pycparser' 'python2-dateutil' 'python2-requests' 'python2-bsdiff4' 'python2-lupa' 'python2-trueskill' 'python2-cffi' 'python2-marshmallow-jsonapi' 'python2-faftools' 'lib32-libpulse' 'wine>1.6.0' 'xdelta3' 'faf-uid' 'faf-ice-adapter')
makedepends=('python2-setuptools' 'python2-pip')
checkdepends=()
optdepends=()
provides=()
conflicts=('python2-fafclient')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/FAForever/client/archive/f28663fdf4b08b68968a1e367df99527a4e74454.tar.gz" 'changes.patch' 'FAForever.desktop')
sha256sums=('67b800dcfba5ca6f179c0335c0cd39b23097345627839bc7cc7a227846b829fb'
            '61dc8f7fbe2a4cd205b81e69260e159aa473a5b82066cfd1d81402a8c88dabcc'
            'f503475daa227d4ce1fa66063b065db7375ce3c0d161d77e3c2bd19c65468cbc')
noextract=()
validpgpkeys=()

prepare() {
  cd "client-f28663fdf4b08b68968a1e367df99527a4e74454"
  patch -p1 < "$srcdir"/changes.patch
  mv src fafclient
}

build() {
  cd "client-f28663fdf4b08b68968a1e367df99527a4e74454"
  FAFCLIENT_VERSION=$pkgver python2 setup.py build
}

package() {
  cd "client-f28663fdf4b08b68968a1e367df99527a4e74454"
  FAFCLIENT_VERSION=$pkgver python2 setup.py install --root="$pkgdir" --optimize=1 
  mkdir -p "$pkgdir/usr/share"
  cp -r "res" "$pkgdir/usr/share/fafclient"
  echo "$pkgver" > "$pkgdir/usr/share/fafclient/RELEASE-VERSION"
  install -D "$srcdir/FAForever.desktop" "$pkgdir/usr/share/applications/FAForever.desktop"
}
