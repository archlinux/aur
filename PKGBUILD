# Maintainer:  Adam Mlady <adam.mlady@elevated.ovh>

pkgname="millennium-bin"
pkgdesc="Open-source modding framework for creating and managing Steam Client themes and plugins"
pkgrel=1

# Commented out pkgver function and makedepends as users report failing to package due to curl missing
# as it is not in `base` package group.
# Makedepends is useless as it runs after pkgver function.
# Will switch to manual packaging although reluctantly.
#
# pkgver=0
#
# pkgver() {
#   curl -s https://api.github.com/repos/SteamClientHomebrew/Millennium/releases | \
#   awk -F'"' '{for(i=1; i<=NF; i++) if($i == "tag_name") {gsub(/^v/, "", $(i+2)); print $(i+2); exit}}' | \
#   sed 's/^v//' | sed 's/-/_/'
# }
# _pkgver="$(pkgver)"

pkgver="3.2.0"

url="https://github.com/SteamClientHomebrew/Millennium"
arch=('x86_64')
license=('MIT')
provides=('millennium')
conflicts=('millennium' 'millennium-git')
# makedepends=('coreutils' 'curl' 'gawk')
depends=('steam')
options=('!strip')
install=millennium-bin.install

source=(
  "${url}/releases/download/v${pkgver//_/-}/millennium-v${pkgver//_/-}-linux-${arch}.tar.gz"
  "${url}/releases/download/v${pkgver//_/-}/millennium-v${pkgver//_/-}-linux-${arch}.sha256"
  "https://raw.githubusercontent.com/SteamClientHomebrew/Millennium/refs/heads/main/LICENSE.md"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

verify() {
  sha256sum -c "millennium-v${pkgver//_/-}-linux-${arch}.sha256"
}

package() {
  install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/millennium/LICENSE.md"
  install -d "${pkgdir}/usr/lib/millennium"
  install -m755 "${srcdir}/usr/lib/millennium/libmillennium_bootstrap_hhx64.so" "${pkgdir}/usr/lib/millennium/"
  install -m755 "${srcdir}/usr/lib/millennium/libmillennium_bootstrap_x86.so" "${pkgdir}/usr/lib/millennium/"
  install -m755 "${srcdir}/usr/lib/millennium/libmillennium_hhx64.so" "${pkgdir}/usr/lib/millennium/"
  install -m755 "${srcdir}/usr/lib/millennium/libmillennium_luavm_x86" "${pkgdir}/usr/lib/millennium/"
  install -m755 "${srcdir}/usr/lib/millennium/libmillennium_pvs64" "${pkgdir}/usr/lib/millennium/"
  install -m755 "${srcdir}/usr/lib/millennium/libmillennium_x86.so" "${pkgdir}/usr/lib/millennium/"
}
