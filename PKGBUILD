# Maintainer: FlowOSS <https://github.com/FlowOSS>
pkgname=flowshot-bin
_pkgname=flowshot
pkgver=0.3.3
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
b2sums=('0c207044211706759205c14b9e4913b4495e718078281628aa197a1f037caac207c068c1dc4172c13ce7c0f7b1338211a6c6a692f01199bded59c131c6e3c8db')
options=('!strip' '!lto' '!debug')

package() {
  bsdtar -xf "$srcdir/$_pkgname-$pkgver-1-x86_64-Arch.pkg.tar.zst" \
    -C "$pkgdir" \
    --exclude .PKGINFO --exclude .MTREE --exclude .BUILDINFO --exclude .INSTALL

  if [[ -d "$pkgdir/usr/share/licenses/$_pkgname" ]]; then
    mv "$pkgdir/usr/share/licenses/$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
  fi
}
