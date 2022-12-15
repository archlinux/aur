# Maintainer: Hauke Rehfeld <aur@haukerehfeld.de>
_pkgname=whisper.cpp
pkgname=${_pkgname}-git
pkgver=5a5c5dd
pkgrel=1
pkgdesc="Port of OpenAI's Whisper model in C/C++"
arch=("i686" "x86_64")
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")

makedepends=("git" )
depends=()
conflicts=("${_pkgname}")
provides=()

source=("${pkgname}::git+https://github.com/ggerganov/whisper.cpp#branch=master")
sha1sums=('SKIP')


pkgver() {
  cd "$pkgname"
  git describe --long --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
}

_BUILDDIR=build

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  install -Dm755 "${srcdir}/$pkgname/main" "${pkgdir}/usr/bin/$_pkgname"
}
