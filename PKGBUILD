# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname=ncspot
pkgname="${_pkgname}-git"
pkgver=0.0.0.95.7aa6d49
pkgrel=1
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
depends=('ncurses' 'openssl')
optdepends=('libpulse: PulseAudio backend'
            'portaudio: PortAudio backend')
makedepends=('rust' 'cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/hrkfdn/ncspot.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags 2>/dev/null || echo "0.0.0-$(git rev-list --count HEAD)-$(git describe --always )" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

