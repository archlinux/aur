# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=python2-fafclient
pkgver=0.11.60+577
pkgrel=1
epoch=0
pkgdesc="Forged Alliance Forever - Lobby Client. Community-driven client system for Supreme Commander: Forged Alliance."
url="http://www.faforever.com/"
arch=('any')
license=('GPL3')
groups=()
depends=('python2-pyqt4>=4.0.0' 'python2-ipaddress' 'python2-enum34' 'python2-pathlib' 'python2-py' 'python2-pycparser' 'python2-dateutil' 'python2-requests' 'python2-bsdiff4' 'python2-lupa' 'python2-trueskill' 'python2-cffi' 'python2-marshmallow-jsonapi' 'python2-faftools' 'xorg-xrandr' 'util-linux' 'pciutils' 'coreutils' 'lib32-libpulse' 'wine>1.6.0')
makedepends=('python2-setuptools' 'python2-pip')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/FAForever/client/archive/abc02517c9d2820002c4eb485bbdf9b907d887e4.tar.gz" 'changes.patch' 'FAForever.desktop' 'https://github.com/FAForever/uid/releases/download/v2.1.0/uid')
sha256sums=('7e86b0bdb7f5074c7a2d2b8a5813e57000e216bab8432affc777ffc0fa235d29'
            '0069559d178d7feb5576c0af7cce53abd0f181104dafb6f6e5b202bbbd1547c4'
            'f503475daa227d4ce1fa66063b065db7375ce3c0d161d77e3c2bd19c65468cbc'
            '9e9f3a561cdbc257c609cee1f517d8025c3fba110b1ea64d3ae3e09327a83dc0')
noextract=()
validpgpkeys=()

prepare() {
  cd "client-abc02517c9d2820002c4eb485bbdf9b907d887e4"
  patch -p1 < "$srcdir"/changes.patch
  chmod +x "$srcdir"/uid
  mv src fafclient
}

build() {
  cd "client-abc02517c9d2820002c4eb485bbdf9b907d887e4"
  FAFCLIENT_VERSION=$pkgver python2 setup.py build
}

package() {
  cd "client-abc02517c9d2820002c4eb485bbdf9b907d887e4"
  FAFCLIENT_VERSION=$pkgver python2 setup.py install --root="$pkgdir" --optimize=1 
  mkdir -p "$pkgdir/usr/share"
  cp -r "res" "$pkgdir/usr/share/fafclient"
  echo "$pkgver" > "$pkgdir/usr/share/fafclient/RELEASE-VERSION"
  install -D "$srcdir/FAForever.desktop" "$pkgdir/usr/share/applications/FAForever.desktop"
  install -D "$srcdir/uid" "$pkgdir/usr/share/fafclient/lib/uid"
}
