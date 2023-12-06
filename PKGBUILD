# Maintainer:
# Contributor: Adler Neves <adlerosn@gmail.com>

_pkgname="anime4k"
pkgname="$_pkgname-git"
pkgver=4.0.1.r40.g8e39551
pkgrel=2
pkgdesc="A High-Quality Real Time Upscaler for Anime Video"
url="https://github.com/bloc97/Anime4K"
license=('MIT')
arch=('any')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "glsl.man"
  "glsladv.man"
)
sha256sums=(
  'SKIP'
  '8a4b346c0dffc2927795a4388b9f53a532bc5d1dfb090142f40ed251eaf75452'
  'bc2a7076956166d51ab9380e2519b479683682df65b5e7822e68782c3706a9d1'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  install -d "${pkgdir}/usr/share/anime4k/tensorflow"
  cp -rf "$_pkgsrc/glsl"/* "${pkgdir:?}/usr/share/anime4k/"
  cp -rf "$_pkgsrc/tensorflow"/* "${pkgdir:?}/usr/share/anime4k/tensorflow/"

  install -Dm644 glsl.man "${pkgdir}/usr/share/man/man1/anime4k.1"
  install -Dm644 glsladv.man "${pkgdir}/usr/share/man/man1/anime4k-advanced.1"

  install -Dm644 "$_pkgsrc/LICENSE" -t "${pkgdir}/usr/share/licenses/$pkgname/"
}
