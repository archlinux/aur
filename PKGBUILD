# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=media-launcher
pkgver=0
pkgrel=1
releaser=akoidan
pkgdesc="Cross-platform tool that generates executable scripts to launch video files with external audio tracks and subtitles. Automatically resolves sidecar media and opens the video in the player of your choice. Designed for fast, repeatable multi-track playback."
url="https://github.com/${releaser}/${pkgname}"
license=('MIT')
arch=('x86_64')

makedepends=('git' 'rust')

optdepends=(
    'mpv: Play generated scripts with mpv (default player)'
    'vlc: Play generated scripts with VLC'
)

source=(
    "${pkgname}::git+https://github.com/${releaser}/${pkgname}.git#branch=main"
)

sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --always | sed 's/^v//; s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D -m755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
