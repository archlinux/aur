# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>

pkgname=voirc-git
pkgver=r5.be94145
pkgrel=1
pkgdesc="Prototype implementation of basic voice chat over IRC text messages"
arch=('any')
url="https://github.com/asiekierka/voirc"
license=('MIT')
makedepends=('git' 'nim')
depends=('libsoundio' 'codec2')
source=(
    "${pkgname%-git}::git+https://github.com/asiekierka/voirc"
    "https://raw.githubusercontent.com/nim-lang/irc/master/src/irc.nim"
    "https://raw.githubusercontent.com/ul/soundio/master/src/soundio.nim"
)
sha512sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"
  cp {irc,soundio}.nim "${pkgname%-git}/lib/"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 voirc "$pkgdir/usr/bin/voirc"
}

