# Maintainer: OGIOS <ogios@foxmail.com>
_pkgname=way-edges
pkgname=way-edges-bin
pkgver=0.11.1
pkgrel=1

pkgdesc="Hidden widget on screen edges"
arch=('x86_64' 'aarch64')
url="https://github.com/way-edges/way-edges"
license=('MIT')

provides=("$_pkgname")
conflicts=("$_pkgname"-git)

depends=(
  'cairo'
  'wayland'
  'libpulse'
)
optdepends=(
  'hyprland: A C++ Compositor'
  'niri: A Rust Compositor based on smithay'
)

_repo=way-edges/way-edges
_tar_name="$_pkgname"_linux-x86_64.tar.gz
_tar_rename="$pkgname"-"$pkgver"-"$pkgrel".tar.gz
_bash_complete=$_pkgname
source=("$_tar_rename"::https://github.com/"$_repo"/releases/download/"$pkgver"/"$_tar_name"
  https://raw.githubusercontent.com/"$_repo"/"$pkgver"/LICENSE
  "$_bash_complete"::https://raw.githubusercontent.com/way-edges/way-edges/refs/heads/master/way-edges-bash-complete.bash)
sha256sums=('SKIP' 'SKIP' 'SKIP')

options=(!debug)

build() {
  tar -zxf "$_tar_rename"
}

package() {
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"

  # bash completion
  mkdir -p "$pkgdir"/usr/share/bash-completion/completions/
  install -m 0644 $_bash_complete "$pkgdir"/usr/share/bash-completion/completions/$_bash_complete
}
