# Maintainer: Daniel Micay <danielmicay@gmail.com>
_gitname=kmscon
pkgname=kmscon-git
pkgver=v9.2.1.r50.g68b92fd
pkgrel=1
epoch=2
pkgdesc='Terminal emulator based on Kernel Mode Setting (KMS)'
arch=(i686 x86_64)
url='https://www.freedesktop.org/wiki/Software/kmscon/'
license=('MIT')
backup=('etc/kmscon/kmscon.conf')
depends=(systemd libdrm mesa libegl libgles pango libxkbcommon xkeyboard-config libtsm)
makedepends=(git meson libxslt docbook-xsl linux-api-headers)
options=(!libtool)
provides=(kmscon)
conflicts=(kmscon)
source=(git+https://github.com/kmscon/kmscon.git)
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe | sed 's/^kmscon\-//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd $_gitname
  meson setup --prefix=/usr --buildtype=plain . build
  meson compile -C build
}

package() {
  cd $_gitname
  meson install -C build --destdir "$pkgdir"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

