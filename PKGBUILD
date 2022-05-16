# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=fossil-gemini-git
_pkgname=${pkgname%-gemini-git}
pkgver=v1.3.r7.g1d069fc
pkgrel=1
pkgdesc="A simple GTK Gopher/Gemini client written in Vala"
url='https://github.com/koyuspace/fossil'
license=(MIT)
arch=(x86_64)
depends=(gtk3 json-glib gnutls)
makedepends=(gtk3 vala meson cmake python json-glib gnutls gettext)
conflicts=(fossil)
source=("git+https://github.com/koyuspace/fossil.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  ./build.sh
}

package() {
  cd "$_pkgname"
  ./install.sh
}
