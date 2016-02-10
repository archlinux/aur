# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=python2-fafclient
pkgver=0.11.47
pkgrel=1
epoch=0
pkgdesc="Forged Alliance Forever - Lobby Client. Community-driven client system for Supreme Commander: Forged Alliance."
url="http://www.faforever.com/"
arch=('any')
license=('GPL3')
groups=()
depends=('python2-pyqt4>=4.0.0' 'python2-ipaddress' 'python2-enum34' 'python2-pathlib' 'python2-py' 'python2-pycparser' 'python2-dateutil' 'python2-requests' 'python2-bsdiff4' 'python2-lupa' 'python2-trueskill' 'python2-cffi' 'python2-marshmallow-jsonapi' 'python2-faftools')
makedepends=()
checkdepends=()
optdepends=('wine>1.6.0')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/FAForever/client/archive/$pkgver.tar.gz" 'changes.patch' 'FAForever.desktop')
sha256sums=('fe1f1406bc5bd4dc719015214578e775f046ca3b6686ed25cba5590e4b894de7'
            '0b7512dd2eb49afaf2c4fc2ea3c755fca4a05c792fc75ec7f7e0b23f449b29f7'
            'f503475daa227d4ce1fa66063b065db7375ce3c0d161d77e3c2bd19c65468cbc')
noextract=()
validpgpkeys=()

prepare() {
	cd "client-$pkgver"
	patch -p1 < "$srcdir"/changes.patch
  mv src fafclient
}

build() {
	cd "client-$pkgver"
	FAFCLIENT_VERSION=$pkgver python2 setup.py build
}

package() {
	cd "client-$pkgver"
	FAFCLIENT_VERSION=$pkgver python2 setup.py install --root="$pkgdir" --optimize=1 
  mkdir -p "$pkgdir/usr/share"
	cp -r "res" "$pkgdir/usr/share/fafclient"
  echo "$pkgver" > "$pkgdir/usr/share/fafclient/RELEASE-VERSION"
  install -D "$srcdir/FAForever.desktop" "$pkgdir/usr/share/applications/FAForever.desktop"
}
