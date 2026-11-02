# Maintainer: HorneroOS contributors <https://github.com/HorneroOS/hornero>
# Native horneroctl binary from GitHub Releases (canonical distribution,
# same pattern as agent-toolkit-bin). _reltag + pkgver + per-arch
# sha256sums are patched at publish time by .github/workflows/release.yml;
# the zero placeholders below fail fast if this template is built directly.
# _reltag carries the real GitHub tag because pkgver must be
# makepkg-safe (no hyphens), while tags use hyphens (v0.2.0-preview2).
pkgname=horneroctl-bin
_reltag=horneroctl-v0.2.0-preview37
pkgver=0.2.0_preview37
pkgrel=2
pkgdesc='HorneroOS system CLI (native binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/HorneroOS/hornero'
license=('MIT')
options=('!strip')
optdepends=(
  'xdg-terminal-exec: launch terminals using Hornero terminal preferences'
  'git: install community Shell plugin packages from HTTPS repositories'
  'minisign: verify signed HorneroOS community plugin registry indexes'
  'hornero-shell: validate community plugin packages with the Shell-owned contract checker'
)
# Release public key as a declared local source: AUR snapshot tarballs
# only include declared sources, so every install path receives it.
# Import once: gpg --import hornero-release.pub (fingerprint must
# match validpgpkeys). Helpers may also fetch it from keyservers.
source=('hornero-release.pub')
sha256sums=('4f18f92773a924e71b1af2045be932f7bc8fa16dcff6266d5c37cf1114605afb')
source_x86_64=(
  "horneroctl-${pkgver}::https://github.com/HorneroOS/hornero/releases/download/${_reltag}/horneroctl-linux-x86_64"
  "horneroctl-${pkgver}.asc::https://github.com/HorneroOS/hornero/releases/download/${_reltag}/horneroctl-linux-x86_64.asc"
)
source_aarch64=(
  "horneroctl-${pkgver}::https://github.com/HorneroOS/hornero/releases/download/${_reltag}/horneroctl-linux-arm64"
  "horneroctl-${pkgver}.asc::https://github.com/HorneroOS/hornero/releases/download/${_reltag}/horneroctl-linux-arm64.asc"
)
# Set to the committed release-key fingerprint by the release workflow.
# An unstamped template intentionally cannot pass makepkg signature checks.
validpgpkeys=('FCFBEE43925AB5429362278AE59EAB44AA2498DC')
sha256sums_x86_64=('e2b79e925f1e81f4c140c525b94239372c88e9067a45f1e4ca744306289fbd71' 'be8f12282a11c94c83cf887834e4a9afb2fa86e558cd5f31bad3d6245e7c74d6')
sha256sums_aarch64=('d19e1d53f733d92d9e83287dfafc4a21de69f713f0099d165741c5beed843505' '0a509d0987fdba08c7294579015f70b695af578e7e5cce5d5465fca032f4868b')

package() {
  install -Dm755 "${srcdir}/horneroctl-${pkgver}" "${pkgdir}/usr/bin/horneroctl"
}
