# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=python2-fafclient
pkgver=0.11.60
pkgrel=0
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
source=("https://github.com/FAForever/client/archive/$pkgver.tar.gz" 'changes.patch' 'FAForever.desktop' 'https://github.com/FAForever/uid/releases/download/v2.1.0/uid')
sha256sums=('0aa89b8b7d53ed17481d1edd5be198a269bd9221d9da953dfb915d9bc97417e5'
            'c847394bddfaa36acc7d08619ed20b4d1a9965051d967f1bc74002b7986652c1'
            'f503475daa227d4ce1fa66063b065db7375ce3c0d161d77e3c2bd19c65468cbc'
            '9e9f3a561cdbc257c609cee1f517d8025c3fba110b1ea64d3ae3e09327a83dc0')
noextract=()
validpgpkeys=()

prepare() {
  cd "client-$pkgver"
  patch -p1 < "$srcdir"/changes.patch
  chmod +x "$srcdir"/uid
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
  install -D "$srcdir/uid" "$pkgdir/usr/share/fafclient/lib/uid"
}
