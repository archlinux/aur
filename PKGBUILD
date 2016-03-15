# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=python2-fafclient
pkgver=0.11.53
pkgrel=4
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
sha256sums=('b0ab99595ccc538d8c47c38cf39013ab20817a0b092682217ebe65307b0be5a9'
            'f2d27543af94239ee697b3178b99ff18af9ae90cc04ae1290fc54a5e874e05de'
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
