# Maintainer: dreieck

_pkgname=favicon-to-png-upload
pkgname="${_pkgname}"

_pkgver="latest"
epoch=0
pkgver=0.3_2021_02_20
pkgrel=2

pkgdesc="Downloads the 'favicon.ico' from a given URL and uploads it's PNG-version to imgur.com. The imgut.com-URL is printed on stdout and pushed to the clipboard. Also supports markdown-output."

license=('GPL3')

arch=(
  'any'
)

depends=(
  'bash'
  'coreutils'
  'curl'
  'imagemagick' # Can also be graphicsmagick.
  'imgur.sh'
  'sed'
)
makedepends=(
  'awk'
)
optdepends=(
  "xclip: To copy the result to the X clipboard."
  "xsel: To copy the result to the X clipboard (alternative to 'xclip')."
)
provides=()
replaces=()
conflicts=()

options=('emptydirs')

source=(
  "favicon-to-png-upload::http://ix.io/2Q37"
)

sha256sums=(
  'd1735de80b57894422bf2142cf0b4cb8213c6a6665c7549062c9125da9636c29'
)

prepare() {
  chmod 755 "${srcdir}/favicon-to-png-upload"
}

pkgver() {
  "${srcdir}/favicon-to-png-upload" -f help | grep -Ei '^Version:' | head -n 1 | awk '{print $2}' | tr '-' '_'
}

package() {
  install -D -m755 -v "${srcdir}/favicon-to-png-upload" "${pkgdir}/usr/bin/favicon-to-png-upload"
}