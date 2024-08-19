# Maintainer: tunalad <tunalad@proton.me>

pkgname=gamescope-3.12.5
pkgver=3.12.5
pkgrel=1
pkgdesc='SteamOS session compositing window manager, version 3.12.5. Packaged as an AppImage.'
arch=(x86_64)
url=https://github.com/ValveSoftware/gamescope
license=(
  BSD-2-Clause
  BSD-3-Clause
  LicenseRef-Reshade
)
options=(!strip)
depends=(
  gcc-libs
  glibc
  glm
  libcap.so
  libdrm
  libliftoff.so
  libpipewire-0.3.so
  libvulkan.so
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxkbcommon.so
  libxmu
  libxrender
  libxres
  libxtst
  libxxf86vm
  openvr
  sdl2
  vulkan-icd-loader
  wayland
  xorg-server-xwayland
  fuse2
)
makedepends=(
  appimagetool-bin
)
source=(
  https://archive.archlinux.org/packages/g/gamescope/gamescope-3.12.5-1-x86_64.pkg.tar.zst
  https://archive.archlinux.org/packages/l/libdisplay-info/libdisplay-info-0.1.1-3-x86_64.pkg.tar.zst
  https://archive.archlinux.org/packages/w/wlroots/wlroots-0.16.2-2-x86_64.pkg.tar.zst
  icon.png
  gamescope.desktop
  AppRun
)
b2sums=(SKIP SKIP SKIP SKIP SKIP SKIP)

prepare() {
  mkdir -p "$srcdir/gamescope.AppDir/usr"

  tar -I zstd -xf "$srcdir/gamescope-3.12.5-1-x86_64.pkg.tar.zst" -C "$srcdir/gamescope.AppDir/"
  tar -I zstd -xf "$srcdir/libdisplay-info-0.1.1-3-x86_64.pkg.tar.zst" -C "$srcdir/gamescope.AppDir/"
  tar -I zstd -xf "$srcdir/wlroots-0.16.2-2-x86_64.pkg.tar.zst" -C "$srcdir/gamescope.AppDir/"

  cp "$srcdir/icon.png" "$srcdir/gamescope.AppDir"
  cp "$srcdir/gamescope.desktop" "$srcdir/gamescope.AppDir"
  cp "$srcdir/AppRun" "$srcdir/gamescope.AppDir"

  chmod +x "$srcdir/gamescope.AppDir/AppRun"
}

build() {
  unset SOURCE_DATE_EPOCH

  ARCH=x86_64 appimagetool "$srcdir/gamescope.AppDir/" "$srcdir/$pkgname-$pkgver-x86_64.AppImage"
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-x86_64.AppImage" "$pkgdir/usr/bin/$pkgname"
}

# vim: ts=2 sw=2 et:
