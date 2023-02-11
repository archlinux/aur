# Maintainer: <mumei AT airmail DOT cc>

_pkgname=GNUMail
pkgname=gnumail.app
pkgrel=1
pkgver=1.4.0
pkgdesc='A mailclient built using GNUstep and a clone of NeXT Mail.app'
arch=('i686' 'x86_64' 'armv7h')
url='http://wiki.gnustep.org/index.php/GNUMail'
license=('LGPL2')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'pantomime' 'addresses.app')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://download.savannah.nongnu.org/releases/gnustep-nonfsf/$_pkgname-$pkgver.tar.gz")
sha256sums=('a4f58bd613a92e59e8e5e1b78a566b036b9d813be9e9bc5afd391a6d6d8a9824')

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
