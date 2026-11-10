pkgname=dispatch-workflows-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='Native Rust desktop runner for sequential GitHub Actions workflows'
arch=('x86_64')
url='https://github.com/skorotkiewicz/dispatch-workflows'
license=('MIT' 'Apache-2.0' 'OFL-1.1')
depends=(
  'ca-certificates'
  'fontconfig'
  'freetype2'
  'glibc'
  'libgcc'
  'libstdc++'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-driver'
  'vulkan-icd-loader'
  'wayland'
  'xdg-utils'
)
optdepends=('github-cli: authenticate using gh auth login instead of a token')
provides=("dispatch-workflows=${pkgver}")
conflicts=('dispatch-workflows')
options=('!strip' '!debug')

_tag=v0.2.1
source_x86_64=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${_tag}/dispatch-workflows-${pkgver}-linux-x64.tar.gz")
sha256sums_x86_64=('54dc936fa5acf04733e0d3ed38d864d40253195d23ceb6a1ecb63928d9ce0c33')

package() {
  install -Dm755 "${srcdir}/Dispatch/dispatch" "${pkgdir}/usr/bin/dispatch-workflows"
  install -Dm644 "${srcdir}/Dispatch/dispatch-workflows.desktop" \
    "${pkgdir}/usr/share/applications/dispatch-workflows.desktop"
  install -Dm644 "${srcdir}/Dispatch/dispatch-workflows.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/dispatch-workflows.svg"
  for file in LICENSE LICENSE-APACHE OFL.txt THIRD_PARTY.md; do
    install -Dm644 "${srcdir}/Dispatch/${file}" "${pkgdir}/usr/share/licenses/${pkgname}/${file}"
  done
}
