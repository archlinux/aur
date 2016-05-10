# Maintainer: Cody P Schafer <archlinux at codyps.com>
_bpn=asciidoc-plantuml
pkgname=${_bpn}-git
pkgver=r4.68fd0d0
pkgrel=1
pkgdesc="Use plantuml syntax to generate various uml documents in asciidoc"
arch=(any)
url="https://github.com/jmesmon/asciidoc-plantuml.git"
license=('BSD')
groups=()
depends=('plantuml')
makedepends=()
provides=(${_bpn})
conflicts=(${_bpn})
replaces=()
backup=()
options=(!emptydirs)
install=
source=(git+https://github.com/jmesmon/asciidoc-plantuml.git)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/${_bpn}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/${_bpn}"
  local _d="$pkgdir/etc/asciidoc/filters/plantuml"
  mkdir -p "${_d}"
  cp source/acplantuml.py source/plantuml-filter.conf "${_d}"
}

# vim:set ts=2 sw=2 et:
