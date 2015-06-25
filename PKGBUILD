# Maintainer: Daniel Micay <danielmicay@gmail.com>
_gitname=kmscon
pkgname=kmscon-git
pkgver=8.15.g3b6fb0f
pkgver() { cd $_gitname && git describe | sed 's/^kmscon\-//; s/-/./g'; }
pkgrel=1
epoch=2
pkgdesc='Terminal emulator based on Kernel Mode Setting (KMS)'
arch=(i686 x86_64)
url='https://github.com/dvdhrm/kmscon'
license=('MIT')
depends=(systemd libdrm mesa libegl libgbm libgles pango libxkbcommon xkeyboard-config libtsm)
makedepends=(git libxslt docbook-xsl linux-api-headers)
options=(!libtool)
provides=(kmscon)
conflicts=(kmscon)
source=(git://people.freedesktop.org/~dvdhrm/kmscon)
md5sums=(SKIP)

build() {
  cd $_gitname
  ./autogen.sh --prefix=/usr --disable-wlterm
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/lib/systemd/system"
  cp COPYING "$pkgdir/usr/share/licenses/$pkgname/"
  cp docs/kmscon{,vt@}.service "$pkgdir/usr/lib/systemd/system/"
}
