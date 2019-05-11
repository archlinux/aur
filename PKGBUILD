# Maintainer: <mumei AT airmail DOT cc>

_pkgname=GNUMail
pkgname=gnumail.app
pkgrel=1
pkgver=1.3.0
pkgdesc='A mailclient built using GNUstep and a clone of NeXT Mail.app'
arch=('i686' 'x86_64' 'armv7h')
url='http://wiki.gnustep.org/index.php/GNUMail'
license=('LGPL2')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'pantomime' 'addresses.app')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://download.savannah.nongnu.org/releases/gnustep-nonfsf/GNUMail-1.3.0.tar.gz")
sha256sums=('c4611bdfd43e84fb133f41747e9ac1078efbc398166af271b15e590eeefcdb76')

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
