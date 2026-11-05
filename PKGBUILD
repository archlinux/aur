# Maintainer: Sami Ben Romdhane <beromdhane@gmail.com>
#
# Prebuilt package: nothing is compiled on the user's machine. The tarball is
# produced by ../build-release-bin.sh and attached to the release named below.
# If you host releases somewhere else (GitHub, your own server), change
# `_upstream` and the tag path in `source` — nothing else depends on the host.

_pkgname=quill
_upstream="https://codeberg.org/samibr/quill"

pkgname=quill-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast, keyboard-driven terminal email client with conversations, a unified inbox and a real address book (prebuilt binary)"
arch=('x86_64')
url="$_upstream"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'zlib' 'brotli' 'zstd')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install="$pkgname.install"
options=('!strip' '!debug')

_asset="quill-$pkgver-x86_64-linux.tar.gz"
source=("$_asset::$_upstream/releases/download/v$pkgver/$_asset")
sha256sums=('cbd958c9e375e8439420017dce923b7d43e26ab0c136878ff87e7a5aaa07053e')

package() {
  cd "$srcdir/quill-$pkgver-x86_64-linux"

  install -Dm755 quill "$pkgdir/usr/bin/quill"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
