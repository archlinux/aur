# Maintainer: Sebastian Meyer <mail@bastimeyer.de>

_pkgname=checkupdates-diff
pkgname="${_pkgname}-git"
pkgver=r8.5d71ad5
pkgrel=1
pkgdesc='Reformats and colorizes the output of the checkupdates utility, similar to yay'
url='https://github.com/bastimeyer/checkupdates-diff'
arch=('any')
license=('GPL-3.0-or-later')
depends=(
  'pacman-contrib'
  'expac'
  'gawk'
)
source=(
  "git+https://github.com/bastimeyer/${_pkgname}.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${_pkgname}"
  install -Dm644 "${_pkgname}.awk" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.awk"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<EOF
#!/usr/bin/env bash
set -eo pipefail
/usr/bin/checkupdates "\${@}" --nocolor | /usr/bin/gawk -f /usr/share/${_pkgname}/${_pkgname}.awk
EOF
}
