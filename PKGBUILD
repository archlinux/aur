# Maintainer: Dusan Borovcanin <borovcanindusan1@gmail.com>

# The binary the Release workflow builds for a v* tag, repackaged.
#
# pkgver and sha256sums are rewritten by scripts/aur-publish.sh when a tag is
# released, so the copy in the repository always describes a real release.

pkgname=slate-bin
_pkgname=slate
pkgver=0.8.1
pkgrel=1
pkgdesc="Minimal, keyboard-first terminal note-taking scratchpad (prebuilt binary)"
# The Release workflow publishes one Linux binary, and it is x86-64.
arch=('x86_64')
url="https://github.com/dborovcanin/slate"
license=('custom')
# What readelf -d records: libgcc_s, libm and libc.
depends=('glibc' 'libgcc')
options=('!debug')
conflicts=('slate' 'slate-git')
# The tag archive comes along for the desktop entry, the icon and the README:
# the release asset is the binary on its own.
source=("$_pkgname-$pkgver-linux-x86_64::$url/releases/download/v$pkgver/slate-linux-x86_64"
  "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('11ed9d77d374dc967d68ad674034dfbc202696783face2e79412657ee1bf578a'
            '00f03c0e0a8403578a64adf31d3f5c39bd135cddc306d3f773847a753c274667')

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver-linux-x86_64" "$pkgdir/usr/bin/$_pkgname"

  cd "$_pkgname-$pkgver"
  install -Dm644 slate.desktop "$pkgdir/usr/share/applications/slate.desktop"
  install -Dm644 slate.png "$pkgdir/usr/share/pixmaps/slate.png"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
