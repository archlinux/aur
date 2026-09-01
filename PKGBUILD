# Maintainer: LUCKY / LuckySingh1 <luckysingh71826@gmail.com>
pkgname=chillpill-shell
pkgver=0.8.1
pkgrel=1
pkgdesc="Lightweight and feature rich dynamic pill bar for Hyprland"
depends=(
       'cliphist'
       'nusgmon-git'
       'inotify-tools'
       'brightnessctl'
       'wl-clipboard'
       'quickshell'
       'qt6-multimedia'
       'qt6-wayland'
       'hyprland'
       'pipewire'
       'awww'
       'networkmanager'
)
optdepends=(
         'ttf-jetbrains-mono-nerd'
         'ttf-monocraft-nerd'
         'qt6-imageformats'
         'python-pip: required to install optional package "holidays" in calendar'
)
makedepends=('tar' 'cmake' 'qt6-base' 'python')
arch=('x86_64')
license=('GPL-3.0')
options=('!debug')
url="https://github.com/LUCKYS1NGHH/ChillPill-Shell"
source=("$pkgname-$pkgver.tar.gz::https://github.com/LUCKYS1NGHH/ChillPill-Shell/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c0d162c2bc69716ab02419688f97f2cc063e0ad96f1f15af6298a46e03df656b')

package() {
  cd "ChillPill-Shell-$pkgver"

  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build -j"$(nproc)"

  install -d "$pkgdir/usr/share/chillpill-shell/IslandBackend"
  cp -r scripts "$pkgdir/usr/share/chillpill-shell"
  cp -r share "$pkgdir/usr/share/chillpill-shell"

  install -m 644 qml/* "$pkgdir/usr/share/chillpill-shell"

  chmod 755 "$pkgdir/usr/share/chillpill-shell/scripts/config_update.py"

  install -m 644 \
    build/libIslandBackend.so \
    build/libIslandBackendPlugin.so \
    build/qmldir \
    build/IslandBackend.qmltypes \
    "$pkgdir/usr/share/chillpill-shell/IslandBackend"

  install -Dm755 launcher.sh "$pkgdir/usr/bin/chillpill-shell"
  install -Dm644 chillpill.desktop "$pkgdir/usr/share/applications/chillpill.desktop"
  install -Dm644 config.jsonc "$pkgdir/usr/share/chillpill-shell/config.jsonc.example"
}

install='chillpill-shell.install'

