# Maintainer: FlowOSS <https://github.com/FlowOSS>
pkgname=flowshot-bin
_pkgname=flowshot
pkgver=0.1.0
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
b2sums=('6c521cedd6371224c962b1c9d1bc9f3d374dedcbd6fc39ff7ec7dd14b5913ce84982be4fa7136855fe1c18ae8482ec08f7e6ff7e73b92b190153540a921b7699')
options=('!strip' '!lto' '!debug')

package() {
  bsdtar -xf "$srcdir/$_pkgname-$pkgver-1-x86_64-Arch.pkg.tar.zst" \
    -C "$pkgdir" \
    --exclude .PKGINFO --exclude .MTREE --exclude .BUILDINFO --exclude .INSTALL

  if [[ -d "$pkgdir/usr/share/licenses/$_pkgname" ]]; then
    mv "$pkgdir/usr/share/licenses/$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
  fi
}
