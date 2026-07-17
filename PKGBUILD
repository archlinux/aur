# Maintainer: gigas002 <gigas002@pm.me>

_pkgname="pavuc"
pkgname="${_pkgname}-git"
pkgver=r8.g860d136
pkgrel=1
pkgdesc="A pavucontrol analogue TUI built with ratatui"
arch=("x86_64")
url="https://github.com/Gigas002/pavuc"
license=('GPL-3.0-or-later')
depends=(libpulse)
makedepends=(git cargo)
optdepends=('pipewire-pulse: PipeWire PulseAudio compatibility layer')
provides=(pavuc)
conflicts=(pavuc)
source=("${_pkgname}::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  cargo build --release
}

package() {
  cd "${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/pavuc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
