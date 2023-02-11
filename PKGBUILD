# Maintainer: <mumei AT airmail DOT cc>
pkgname=projectcenter
_pkgname=ProjectCenter
pkgrel=1
pkgver=0.7.0
pkgdesc="GNUstep's integrated development environment (IDE)."
arch=('i686' 'x86_64')
url="https://github.com/gnustep/apps-projectcenter"
license=('GPL')
install=$pkgname.install
#depends=('gnustep-base'
#         'gnustep-gui'
#         'gnustep-back')
makedepends=('gcc-objc'
             'gnustep-make')
source=(https://github.com/gnustep/apps-projectcenter/releases/download/projectcenter-${pkgver//./_}/$_pkgname-$pkgver.tar.gz)
sha256sums=('39f673c8c353f85c257191cc8d0c280ef49a2daa7f7150284cbe1608db792587')

# They key posted on github was a DSA key, the file is not signed with a valid pubkey
#validpgpkeys=('5023D366016912D0')

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
