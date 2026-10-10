# Maintainer: Yasen Pavlov <yasen.pavlov+aur@bitnet.me>
#
# AUR binary package: repackages the Arch package attached to the GitHub release (built
# from the tagged commit by the release workflow). Generated from
# https://github.com/yasen-pavlov/ultra_9000/tree/main/packaging/aur, which fills in pkgver,
# pkgrel and sha256sums (from the release's SHA256SUMS.txt) for every release; change the
# template there, not on the AUR.

pkgname=ultra-9000-bin
_pkgname=ultra-9000
pkgver=0.1.1
pkgrel=1
pkgdesc='Agent harness with native Alacritty terminals in a Tauri/Svelte interface (prebuilt)'
arch=('x86_64')
url='https://github.com/yasen-pavlov/ultra_9000'
license=('MIT OR Apache-2.0')
# Every library the binary links directly, plus librsvg, libxkbcommon, mesa (EGL) and
# wayland, which it loads at runtime (namcap reports those four as possibly unneeded).
depends=(
  'cairo'
  'dbus'
  'fontconfig'
  'freetype2'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'librsvg'
  'libsoup3'
  'libxkbcommon'
  'mesa'
  'pango'
  'wayland'
  'webkit2gtk-4.1'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
# The release's package always has pkgrel 1.
_asset="$_pkgname-$pkgver-1-x86_64.pkg.tar.zst"
source=("$url/releases/download/v$pkgver/$_asset")
noextract=("$_asset")
sha256sums=('0eca744b66a8d652c71b16c39583fbc959e8447aafc388c6d447fc7bb4358e14')

package() {
  bsdtar -xf "$srcdir/$_asset" -C "$pkgdir" \
    --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE --exclude .INSTALL
  mv "$pkgdir/usr/share/licenses/$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
}
