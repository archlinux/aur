# Maintainer: Zaedus <thezaedus@proton.me>

_pkgname="youtube-tui"
pkgname="${_pkgname}-git"
pkgver=r23.a5c2976
pkgrel=1
pkgdesc="An aesthetically pleasing TUI frontend to browsing YouTube written in Rust."
arch=('x86_64')
url="https://github.com/Siriusmart/youtube-tui"
license=('GPL')
depends=('libsixel')
optdepends=(
  'mpv: default video player'
  'konsole: default terminal emulator'
  'yt-dlp: default youtube downloader'
)
makedepends=('rust' 'cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/Siriusmart/youtube-tui.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  cargo fetch --locked
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release --locked
}

check() {
  cd "${srcdir}/${_pkgname}"
  cargo test --release --locked
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 755 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
