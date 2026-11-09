# Maintainer: CPT-Dawn <ping@cptdawn.dev>
#
# Template for the zenith-bar-bin AUR package: the binary that the release
# workflow builds in an Arch container and attaches to the GitHub Release.
# The release workflow fills in pkgver, pkgrel and sha256sums with
# .github/scripts/generate_aur_files.sh --package zenith-bar-bin.
pkgname=zenith-bar-bin
_pkgname=zenith-bar
pkgver=2.3.1
pkgrel=1
pkgdesc="The lightest beautiful status bar for Wayland (prebuilt binary)"
arch=('x86_64')
url="https://github.com/CPT-Dawn/Zenith"
license=('MIT')
depends=(
  'libgcc'
  'glib2'
  'glibc'
  'graphene'
  'gtk4>=1:4.22'
  'gtk4-layer-shell'
  'pango'
)
optdepends=('ttf-inter: the recommended UI font'
            'hoarder: clipboard history for the clipboard module')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
# The release build is already stripped.
options=('!strip' '!debug')
install="${_pkgname}.install"
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.tar.gz")
sha256sums_x86_64=('559550d1ed66fd09f8fa789840a58ae84d7061190e8e90b046db36eb8195c273')

package() {
  cd "${_pkgname}-${pkgver}-x86_64"
  install -Dm755 zenith-bar "${pkgdir}/usr/bin/zenith-bar"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
