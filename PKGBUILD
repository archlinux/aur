# Maintainer: RamazanBerk20 <119219364+RamazanBerk20@users.noreply.github.com>
pkgname=swiftsim-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Fast SPICE circuit simulator with a schematic editor and waveform viewer (LTspice alternative; prebuilt)'
arch=('x86_64')
url='https://github.com/RamazanBerk20/SwiftSim'
license=('MIT OR Apache-2.0' 'OFL-1.1')
depends=('gcc-libs' 'glibc' 'dbus' 'fontconfig' 'libglvnd' 'libx11' 'libxcb' 'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'wayland')
optdepends=('vulkan-icd-loader: Vulkan rendering (OpenGL is used otherwise)'
            'xdg-desktop-portal: Open/Save dialogs'
            'zenity: Open/Save dialogs without a desktop portal')
provides=('swiftsim')
conflicts=('swiftsim')
source=("swiftsim-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/swiftsim-linux-x86_64.tar.gz")
sha256sums=('38cf625dddc54c56cabdb6e97bfc59fabe7e2144f593f2e706f952ef582ea426')

package() {
  cd swiftsim-linux-x86_64
  install -Dm755 swiftsim -t "$pkgdir/usr/bin"
  install -Dm644 swiftsim.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 swiftsim.xml -t "$pkgdir/usr/share/mime/packages"
  install -Dm644 swiftsim.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/swiftsim.svg"
  for png in icons/*.png; do
    s=$(basename "$png" .png)
    install -Dm644 "$png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/swiftsim.png"
  done
  install -Dm644 LICENSE-MIT LICENSE-APACHE LICENSE-OFL -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
