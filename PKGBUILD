# Maintainer: Sami Ben Romdhane <beromdhane@gmail.com>
#
# Prebuilt package: nothing is compiled on the user's machine. The tarball is
# produced by ../build-release-bin.sh and attached to the release named below.
# If you host releases somewhere else (GitHub, your own server), change
# `_upstream` and the tag path in `source` — nothing else depends on the host.

_pkgname=alasraa
_upstream="https://codeberg.org/samibr/alasraa"

pkgname=alasraa-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Fast, OpenGL terminal emulator for Linux (prebuilt binary)"
arch=('x86_64')
url="$_upstream"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'openssl' 'zlib' 'brotli' 'zstd' 'wayland' 'libxcb'
         'libxkbcommon' 'pixman' 'cairo' 'pango' 'harfbuzz' 'fontconfig')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install="$pkgname.install"
options=('!strip' '!debug')

_asset="alasraa-$pkgver-x86_64-linux.tar.gz"
source=("$_asset::$_upstream/releases/download/v$pkgver/$_asset")
sha256sums=('b240ed9937ccf9df5a2ee89aebae0e64e4a2dcdc9d1dfd994a1e9bddf3cefe05')

package() {
  cd "$srcdir/alasraa-$pkgver-x86_64-linux"

  install -Dm755 alasraa "$pkgdir/usr/bin/alasraa"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 alasraa-logo.jpeg "$pkgdir/usr/share/pixmaps/alasraa.png"
}