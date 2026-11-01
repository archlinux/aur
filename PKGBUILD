# Maintainer: Jingrong Chen <crazyboycjr at gmail dot com>
#
# The repository's packaging/arch/PKGBUILD builds its working tree with the
# same dependencies and package(); keep the two alike. pkgver follows the
# xcompmgr release the fork is based on, and the fork tags it as v<version>
# (v1.1.10); a fork-only fix before the next upstream release bumps pkgrel.
# To release:
#   1. push the tag to github.com/crazyboycjr/xcompmgr-zoom, and set pkgver
#      and pkgrel here;
#   2. updpkgsums, which puts the tarball's sha256 in place of SKIP;
#   3. makepkg --printsrcinfo > .SRCINFO;
#   4. makepkg -f, a test build, and namcap PKGBUILD xcompmgr-zoom-*.pkg.tar.*;
#   5. git commit -am "xcompmgr-zoom $pkgver", and git push.
pkgname=xcompmgr-zoom
pkgver=1.1.10
pkgrel=1
pkgdesc='Composite window effect manager for X.org, with full-desktop zoom'
arch=('x86_64')
url='https://github.com/crazyboycjr/xcompmgr-zoom'
license=('MIT')
depends=('glibc' 'libx11' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxrender')
makedepends=('meson' 'xorgproto')
provides=("xcompmgr=$pkgver")
conflicts=('xcompmgr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aaf89b1a2671244560eaa543a4c85b2008c6696c1cab05a31c22514434df75af')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/COPYING" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
