# Maintainer:  dreieck

_pkgname="firefox-developer-edition-firefox-symlink"
pkgname="${_pkgname}-latest"
pkgver=66.0b4
pkgrel=1
pkgdesc="Adds a 'firefox'-symlink for 'firefox-developer-edition'."
arch=("any")
license=(
  'MPL'
  'GPL'
  'LGPL'
) # The licenses of 'firefox-developer-edition'.
depends=(
  "firefox-developer-edition"
)
provides=(
  "${_pkgname}=${pkgver}"
  "firefox=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "firefox"
)

pkgver() {
  # firefox-developer-edition --version | awk '{print $3}'
  pacman -Qi firefox-developer-edition | grep -E '^Version[[:space:]]*:' | awk -F ':' '{print $2}' | tr -d '[[:space:]]' | sed -E 's|\-[^-]*$||'
}

package() {
  install -d -m755 "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  ln -s -T "firefox-developer-edition" "firefox"
}
