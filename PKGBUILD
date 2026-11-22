# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Falk Alexander Seidl <fa@terminal.run>

# shellcheck disable=SC2034
pkgname=sequeler
pkgver=0.9.1
pkgrel=1
pkgdesc='Friendly SQL Client'
arch=('x86_64')
url="https://github.com/Alecaddd/$pkgname"
license=('GPL-3.0-or-later')
depends=('granite' 'libgda5-mysql' 'libgda5-postgres' 'gtksourceview4' 'libsecret')
makedepends=('meson' 'vala')

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=('780b5066cce3a7ef333b0d2033b947623804cfbb8ff9a89ab273954845049292')

build() {
  local more_c_flags=(
    '-Wno-unused-but-set-variable'
    '-Wno-unused-value'
    '-Wno-unused-variable'
    '-Wno-unused-function'
    '-Wno-discarded-qualifiers'
    '-Wno-deprecated-declarations'
  )
  local nostrict=$(IFS=' '; echo "${more_c_flags[*]}")

  arch-meson "${pkgname}-${pkgver}" build -Dc_args="$nostrict"
  meson compile -C build
}

# shellcheck disable=SC2154
package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
