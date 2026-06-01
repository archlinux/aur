# Maintainer: Ryan Bas <ryanbas21@github>
pkgname=camlwm-git
pkgver=0.1.0
pkgrel=1
pkgdesc="xmonad-style tiling window manager for X11, written in OCaml"
arch=('x86_64')
url="https://github.com/ryanbas21/CamlWM"
license=('MIT')
depends=('libx11')
makedepends=('git' 'ocaml' 'dune' 'ocaml-ctypes' 'ocaml-findlib' 'libffi')
provides=('camlwm')
conflicts=('camlwm')
source=("git+https://github.com/ryanbas21/CamlWM.git")
sha256sums=('SKIP')

pkgver() {
  cd CamlWM
  printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd CamlWM
  dune build @install
}

package() {
  cd CamlWM
  install -Dm755 _build/default/bin/main.exe "$pkgdir/usr/bin/camlwm"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
