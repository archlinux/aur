# Maintainer: Kookies <kookies@tutamail.com>
pkgname=wfslib-git
pkgver=wfslib.v0.6.46.r14.gf025625
pkgrel=1
pkgdesc="WFS (WiiU File System) Library and Tools"
arch=('x86_64')
url="https://github.com/koolkdev/wfslib"
license=('MIT')
depends=('fuse2' 'crypto++' 'boost-libs')
makedepends=('git' 'boost')
provides=('wfslib')
conflicts=('wfslib')
source=('wfslib::git+https://github.com/koolkdev/wfslib')
md5sums=('SKIP')

_sourcedirectory="wfslib"

pkgver() {
  cd "$srcdir/$_sourcedirectory/"
  git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
  cd "$srcdir/$_sourcedirectory/"
  make
}

package() {
  cd "$srcdir/$_sourcedirectory/"
  install -D 'wfs-extract/wfs-extract' "$pkgdir/usr/bin/wfs-extract"
  install -D 'wfs-file-injector/wfs-file-injector' "$pkgdir/usr/bin/wfs-file-injector"
  install -D 'wfs-fuse/wfs-fuse' "$pkgdir/usr/bin/wfs-fuse"

  # license
  install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
