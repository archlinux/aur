# Maintainer: Javier Tia <floss@jetm.me>

pkgname=ytcui
pkgver=4.1.0
pkgrel=1
pkgdesc='A lightweight terminal-based YouTube client written in C++'
arch=('x86_64')
url="https://github.com/MilkmanAbi/${pkgname}"
license=('MIT')
depends=(yt-dlp ncurses mpv curl libsixel)
makedepends=(git)
optdepends=('chafa: thumbnail rendering on non-sixel terminals')
conflicts=(ytcui-bin)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  cat VERSION
}

build() {
  cd "${srcdir}/${pkgname}"
  make BACKEND=ytdlp SIXEL=libsixel
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
  # The VERSION file is only consumed at build time
  rm -r "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
