# Maintainer: cat_nm
pkgname=ags-hyprpanel-git
pkgver=r292.f2985e7
pkgrel=2
pkgdesc="A Bar/Panel for Hyprland with extensive customizability"
arch=('x86_64')
url="https://hyprpanel.com/"
license=('MIT')
install='hyprpanel.install'
depends=(
  # official repository:
  'pipewire'
  'libgtop'
  'bluez'
  'bluez-utils'
  'btop'
  'networkmanager'
  'dart-sass'
  'wl-clipboard'
  'brightnessctl'
  'swww'
  'gnome-bluetooth-3.0'
  'libdbusmenu-gtk3'
  # aur:
  'grimblast-git'
  'gpu-screen-recorder-git'
  'hyprpicker'
  'matugen-bin'
  'aylurs-gtk-shell'
  'bun-bin'
)
makedepends=(
  'unzip'
  'git'
)
optdepends=(
  'python: GPU usage tracking (NVidia only)'
  'python-gpustat: GPU usage tracking (NVidia only)'
  'pywal: Pywal hook for wallpapers'
  'pacman-contrib: Checking for pacman updates'
  'power-profiles-daemon: Switch power profiles'
)
source=('git+https://github.com/Jas-SinghFSU/HyprPanel.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/HyprPanel"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/HyprPanel"

  # install fonts
  install -dm755 "$pkgdir/usr/share/fonts/NFP"
  cp -r "$srcdir/HyprPanel/assets/fonts/"* "$pkgdir/usr/share/fonts/NFP/"
  fc-cache -fv

  # Install HyprPanel into /usr/share/HyprPanel
  install -dm755 "$pkgdir/usr/share/HyprPanel"
  cp -r ./* "$pkgdir/usr/share/HyprPanel/"

  # License
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
