# Maintainer: FlowOSS <https://github.com/FlowOSS>
pkgname=flowshot-bin
_pkgname=flowshot
pkgver=0.3.2
pkgrel=1
pkgdesc='Screenshot and annotation tool for Wayland and X11 with mixed-DPI support (prebuilt binary)'
arch=('x86_64')
url='https://github.com/FlowOSS/flowshot'
license=('GPL-3.0-or-later')
depends=(
  'glibc'
  'libgcc'
  'libpipewire-0.3.so'
  # dlopen'd or data-only: real runtime deps, namcap warnings are false positives
  'wayland'
  'vulkan-icd-loader'
  'fontconfig'
  'ttf-font'
  'hicolor-icon-theme'
)
optdepends=(
  'xdg-desktop-portal: portal capture, global shortcuts and OpenURI'
  'xdg-desktop-portal-gnome: portal backend for GNOME'
  'xdg-desktop-portal-kde: portal backend for KDE Plasma (KWin ScreenShot2)'
  'xdg-desktop-portal-hyprland: portal backend for Hyprland'
  'xdg-desktop-portal-wlr: portal backend for wlroots compositors (Sway)'
  'vulkan-driver: Vulkan implementation for the GPU-accelerated overlay'
  'gnome-shell-extension-appindicator: system tray icon under GNOME'
)
provides=("flowshot=$pkgver")
conflicts=('flowshot' 'flowshot-git')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-1-x86_64-Arch.pkg.tar.zst")
b2sums=('2e9df867e4beea71989b81ffa885a1fafc38697d36a122d17a44e1d3c1f28ab09a5d5a4c572c6d2329e69ee7457c7a7b4e5d358c32c0bb1f592db2987f0d410d')
options=('!strip' '!lto' '!debug')

package() {
  bsdtar -xf "$srcdir/$_pkgname-$pkgver-1-x86_64-Arch.pkg.tar.zst" \
    -C "$pkgdir" \
    --exclude .PKGINFO --exclude .MTREE --exclude .BUILDINFO --exclude .INSTALL

  if [[ -d "$pkgdir/usr/share/licenses/$_pkgname" ]]; then
    mv "$pkgdir/usr/share/licenses/$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
  fi
}
