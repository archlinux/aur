# Maintainer: Jingrong Chen <crazyboycjr at gmail dot com>
#
# The repository's packaging/arch/PKGBUILD builds its working tree with the
# same dependencies and package(); keep the two alike. Releases are tagged
# v<xcompmgr version>-zoom<n>, such as v1.1.10-zoom1, and pkgver is the tag
# with a dot for the hyphen, 1.1.10.zoom1. To release:
#   1. with the repository public, push the tag to
#      github.com/crazyboycjr/xcompmgr-zoom, and set _tag, pkgver and
#      pkgrel=1 here;
#   2. updpkgsums, which puts the tarball's sha256 in place of SKIP;
#   3. makepkg --printsrcinfo > .SRCINFO;
#   4. makepkg -f, a test build, and namcap PKGBUILD xcompmgr-zoom-*.pkg.tar.*;
#   5. git commit -am "xcompmgr-zoom $pkgver", and git push.
pkgname=xcompmgr-zoom
_tag=v1.1.10-zoom1
pkgver=1.1.10.zoom1
pkgrel=1
pkgdesc='Composite window effect manager for X.org, with full-desktop zoom'
arch=('x86_64')
url='https://github.com/crazyboycjr/xcompmgr-zoom'
license=('MIT')
depends=('glibc' 'libx11' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxrender')
makedepends=('meson' 'xorgproto')
provides=('xcompmgr')
conflicts=('xcompmgr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('SKIP')

build() {
  arch-meson "$pkgname-${_tag#v}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-${_tag#v}/COPYING" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
