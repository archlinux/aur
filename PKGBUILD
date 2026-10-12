# Maintainer: giosuel <me@giosuel.ch>
pkgname=somedesk-bin
_pkgname=somedesk
pkgver=0.1.0
pkgrel=1
pkgdesc='Self-hosted, end-to-end encrypted remote desktop (prebuilt binary)'
arch=('x86_64')
url='https://github.com/giosuel/somedesk'
license=('AGPL-3.0-or-later')
# The libraries for X11, Wayland and OpenGL are loaded at runtime (winit, glutin).
depends=('fontconfig' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libglvnd' 'libpipewire' 'libstdc++'
         'libx11' 'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'libxrandr' 'wayland')
optdepends=('xdg-desktop-portal: screen sharing and remote control on Wayland')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug') # the release binary is already stripped
source_x86_64=("$url/releases/download/v$pkgver/SomeDesk-$pkgver-linux-x64.tar.gz")
sha256sums_x86_64=('e21e51162ba36c94d12f2c32b1dd542270b5cb497025638b4ef32dde5ee06931')

package() {
  cd "SomeDesk-$pkgver-linux-x64"
  install -Dm755 somedesk -t "$pkgdir/usr/bin"
  install -Dm644 packaging/linux/ch.giosuel.SomeDesk.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/linux/ch.giosuel.SomeDesk.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 assets/brand/app-icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/ch.giosuel.SomeDesk.svg"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
