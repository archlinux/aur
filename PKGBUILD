# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=media-launcher-git
pkgbase=media-launcher-git
_pkgname=media-launcher
pkgver=cb31997
pkgrel=1
releaser=akoidan
pkgdesc="Generate mpv/vlc launch scripts for videos with external audio and subtitles"
url="https://github.com/${releaser}/${_pkgname}"
license=('MIT')
arch=('x86_64')

makedepends=('git' 'rust')

optdepends=(
    'mpv: Play generated scripts with mpv (default player)'
    'vlc: Play generated scripts with VLC'
)

provides=('media-launcher')
conflicts=('media-launcher')

source=(
    "${_pkgname}::git+https://github.com/${releaser}/${_pkgname}#branch=main"
)

sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --always | sed 's/^v//; s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
