# Maintainer: scottbass3 <valentin dot carroy at hotmail dot fr>

pkgname=scottbass3-greeter-git
_name=greeter
pkgver=r2.fe0e9b5
pkgrel=1
pkgdesc="greetd greeter for Hyprland built on Quickshell, with the scottbass3-shell lock screen look"
arch=('any')
url="https://github.com/scottbass3/greeter"
license=('GPL-3.0-or-later')
depends=('greetd' 'quickshell' 'hyprland' 'qt6-declarative')
makedepends=('git')
optdepends=(
  'ttf-jetbrains-mono-nerd: default font'
  'upower: battery level'
  'xorg-xinit: X11 sessions'
)
provides=('scottbass3-greeter')
conflicts=('scottbass3-greeter')
source=("$_name::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_name"
  local dest="$pkgdir/usr/share/scottbass3-greeter"
  install -d "$dest"
  cp -r components hypr services theme GreeterSurface.qml shell.qml "$dest/"
  install -Dm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/scottbass3-greeter.conf"
  install -Dm644 config.example.json -t "$pkgdir/usr/share/doc/scottbass3-greeter/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/scottbass3-greeter/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
