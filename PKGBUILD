# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=python2-fafclient-icetest
pkgver=0.11.60+577
pkgrel=3
epoch=0
pkgdesc="Forged Alliance Forever - Lobby Client. Community-driven client system for Supreme Commander: Forged Alliance."
url="http://www.faforever.com/"
arch=('any')
license=('GPL3')
groups=()
depends=('python2-pyqt4>=4.0.0' 'python2-ipaddress' 'python2-enum34' 'python2-pathlib' 'python2-py' 'python2-pycparser' 'python2-dateutil' 'python2-requests' 'python2-bsdiff4' 'python2-lupa' 'python2-trueskill' 'python2-cffi' 'python2-marshmallow-jsonapi' 'python2-faftools' 'lib32-libpulse' 'wine>1.6.0' 'xdelta3' 'faf-uid' 'faf-ice-adapter>=2.2')
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
_commitsha=59d5cd7dff853019d0b4207202877fd1b89d9ae9
source=("https://github.com/FAForever/client/archive/$_commitsha.tar.gz" 'FAForever.desktop')
sha256sums=('5f145c09db83792c0b1a7cf1dd7f8ca8bb797a40b4075f4be7921ed5e0a96763'
            'f503475daa227d4ce1fa66063b065db7375ce3c0d161d77e3c2bd19c65468cbc')
noextract=()
validpgpkeys=()

prepare() {
  cd "client-$_commitsha"
  mv src fafclient
}

build() {
  cd "client-$_commitsha"
  FAFCLIENT_VERSION=$pkgver python2 setup.py build
}

package() {
  cd "client-$_commitsha"
  FAFCLIENT_VERSION=$pkgver python2 setup.py install --root="$pkgdir" --optimize=1 
  mkdir -p "$pkgdir/usr/share"
  cp -r "res" "$pkgdir/usr/share/fafclient"
  echo "$pkgver" > "$pkgdir/usr/share/fafclient/RELEASE-VERSION"
  install -D "$srcdir/FAForever.desktop" "$pkgdir/usr/share/applications/FAForever.desktop"
}
