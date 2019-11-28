# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname=ncspot
pkgname="${_pkgname}-git"
pkgver=0.1.1
pkgrel=1
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
depends=('ncurses' 'openssl' 'libpulse')
optdepends=('portaudio: PortAudio backend')
makedepends=('rust' 'cargo' 'git' 'alsa-lib' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/hrkfdn/ncspot.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release
}

check() {
  cd "${srcdir}/${_pkgname}"
  cargo test --release
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 755 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

