# Maintainer: teejer <teejer@users.noreply.github.com>
# Fork build of uniterm carrying two not-yet-upstream patches:
#   - AI thinking/reasoning visibility (upstream PR #1084)
#   - GNOME/Wayland desktop-file app_id fix (upstream PR #1085)
# Built by GitHub Actions from https://github.com/Teejer/uniterm (branch
# local-build). Once both PRs ship in an official upstream release, retire
# this package and use uniterm-bin instead.

pkgname=uniterm-fork-bin
pkgver=1.9.5.thinking.1
pkgrel=1
pkgdesc="Lightweight all-in-one terminal with 30+ protocols and a built-in autonomous AI agent (fork build: AI thinking stream + Wayland launcher fix)"
arch=('x86_64' 'aarch64')
url="https://uniterm.net"
license=('Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('uniterm')
conflicts=('uniterm' 'uniterm-bin' 'uniterm-git')
options=('!strip' '!debug')

_gh="https://github.com/Teejer/uniterm/releases/download/v${pkgver}"

source_x86_64=(
  "${_gh}/uniterm-linux-amd64-v${pkgver}.deb"
  "LICENSE::https://raw.githubusercontent.com/Teejer/uniterm/v${pkgver}/LICENSE"
)
sha256sums_x86_64=(
  'f6794af38ac2c301df2e818fbb0ace00ac688f12ab2914dec59247a0c99dcb55'
  '80b7ddff03e2b4535e40a063a1079d4e02f57826720d6c9b2eb8d635bbec0715'
)

source_aarch64=(
  "${_gh}/uniterm-linux-arm64-v${pkgver}.deb"
  "LICENSE::https://raw.githubusercontent.com/Teejer/uniterm/v${pkgver}/LICENSE"
)
sha256sums_aarch64=(
  '9de16b1d293097af9e64bc1921f8aa45f975245d11f2d3cd8d978d4724ba0c59'
  '80b7ddff03e2b4535e40a063a1079d4e02f57826720d6c9b2eb8d635bbec0715'
)

package() {
  # makepkg already unpacked the .deb (an ar archive) into $srcdir,
  # leaving its payload in data.tar.*. Install that verbatim: /usr/bin/uniterm,
  # /usr/share/applications/org.wails.uniterm.desktop (matches the Wayland
  # app_id; see upstream PR #1085) and the hicolor icons.
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
