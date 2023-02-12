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
sha256sums=('2d90ed91669cdbc77506860f0157dfb8170258b479b436941d8172ec7a9dcc0b')

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
