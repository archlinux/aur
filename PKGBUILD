# Maintainer: Your Name <youremail@domain.com>
pkgname=python2-fafclient
pkgver=0.11.44
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
source=("https://github.com/FAForever/client/archive/$pkgver.tar.gz" 'changes.patch')
sha256sums=('3c0f0647df78674974fd02baa409c532191e74f663093c5c4597aae28404a15a' 'aa26012c1beb54c7895d8ed78474ea9bf1069782231a6feaa66ba96e23130d90')
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
}
