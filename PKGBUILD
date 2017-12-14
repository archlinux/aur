# Maintainer:  Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:r: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mono-upnp-git
_pkgbase=mono-upnp
pkgver=0.1.2
pkgrel=3
pkgdesc="UPNP binding for Mono/.NET"
arch=('i686' 'x86_64')
url="https://github.com/mono/mono-upnp"
license=('MIT')
depends=('gtk-sharp-2' 'mono-addins' 'taglib-sharp-git')
conflicts=($_pkgbase)
provides=($_pkgbase)
source=(git+https://github.com/mono/mono-upnp.git
https://github.com/DynamicDevices/mono-upnp/commit/95780e8ec440c3714a6fcf167cf7cd1d0f55d94a.diff)
md5sums=('SKIP'
'b2f9bfb0a6d9f64fa8754129db40c44b')

prepare() {
  cd "$srcdir/$_pkgbase"
  patch -p1 -i $srcdir/95780e8ec440c3714a6fcf167cf7cd1d0f55d94a.diff

}

build() {
  cd "$srcdir/$_pkgbase"
  ./autogen.sh --prefix=/usr --disable-tests
  make
}

package() {
  cd "$srcdir/$_pkgbase"

  make DESTDIR="$pkgdir/" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgbase/COPYING"
}
