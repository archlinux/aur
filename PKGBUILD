# Maintainer: araaha <ara.ahady at gmail dot com>
pkgname=yavcpdf-bin
_name=yavcpdf
pkgver=0.3.0
pkgrel=1
pkgdesc='A minimal, keyboard-driven PDF viewer (release binary)'
arch=('x86_64')
url='https://github.com/araaha/yavcpdf'
license=('MIT OR Apache-2.0')
# The binary is built on Ubuntu 22.04 (glibc 2.35).
# Linked at build time: only gcc-libs and glibc (libgcc_s, libm, libc, ld-linux). At run time
# eframe/winit/glutin dlopen libglvnd (libEGL/libGL), wayland (client/egl), the X11 libs,
# xkbcommon and dbus. fontconfig is needed only for the fc-match binary that src/chrome.rs runs.
depends=(
  'gcc-libs'
  'glibc'
  'dbus'
  'fontconfig'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrender'
  'wayland'
)
optdepends=(
  'xdg-desktop-portal: file chooser for Ctrl-t / :open'
  'xdg-utils: open links in a browser'
)
provides=("yavcpdf=$pkgver")
conflicts=('yavcpdf')
source=("$_name-v$pkgver-x86_64-linux.tar.gz::https://github.com/araaha/yavcpdf/releases/download/v$pkgver/$_name-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('c473c4663fddab1da35536a8f9d578ac59b768e1d25d16099bd61d93ad30ab7c')

package() {
  cd "$_name-v$pkgver-x86_64-linux"
  install -Dm755 yavcpdf "$pkgdir/usr/bin/yavcpdf"
  install -Dm644 yavcpdf.desktop "$pkgdir/usr/share/applications/yavcpdf.desktop"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_name/README.md"
  install -Dm644 config.toml "$pkgdir/usr/share/doc/$_name/config.toml"
  install -Dm644 LICENSE-MIT LICENSE-APACHE NOTICE ATTRIBUTION.md -t "$pkgdir/usr/share/licenses/$_name/"
  install -Dm644 licenses/* -t "$pkgdir/usr/share/licenses/$_name/"
}
