# Maintainer: wanxp

pkgname=codex-hub-desktop-bin
pkgver=0.4.6
pkgrel=1
pkgdesc='Desktop control console for Codex App SSH workspaces'
arch=('x86_64' 'aarch64')
url='https://github.com/Jurio0304/CodexHub'
license=('MIT')
depends=(
  'dbus'
  'gcc-libs'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libsecret'
  'openssh'
  'openssl'
  'webkit2gtk-4.1'
  'xdg-utils'
)
provides=("codex-hub=${pkgver}" "codex-hub-desktop=${pkgver}")
conflicts=('codex-hub' 'codex-hub-desktop')
options=('!strip' '!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/Jurio0304/CodexHub/v${pkgver}/LICENSE")
source_x86_64=("CodexHub-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/CodexHub_${pkgver}_amd64.deb")
source_aarch64=("CodexHub-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/CodexHub_${pkgver}_arm64.deb")
sha256sums=('ad11dbacbd0ae13b9f8750ab322ff4d7593ff53674897c2ef6af60a58534de59')
sha256sums_x86_64=('bc63ab143771611954d1d596992f9d65b737480be61c1a32cb022ea5c4c41f46')
sha256sums_aarch64=('6da95ee987a8ca8eb5e9e11a08f479a7da64e0510a2d33dcd2f5a6eb3d988899')

package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  sed -i \
    -e 's/^Categories=.*/Categories=Network;RemoteAccess;/' \
    -e 's/^Comment=.*/Comment=Desktop control console for Codex App SSH workspaces/' \
    "${pkgdir}/usr/share/applications/CodexHub.desktop"
}
