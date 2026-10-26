# Maintainer: HorneroOS contributors <https://github.com/HorneroOS/hornero>
# Native horneroctl binary from GitHub Releases (canonical distribution,
# same pattern as agent-toolkit-bin). _reltag + pkgver + per-arch
# sha256sums are patched at publish time by .github/workflows/release.yml;
# the zero placeholders below fail fast if this template is built directly.
# _reltag carries the real GitHub tag because pkgver must be
# makepkg-safe (no hyphens), while tags use hyphens (v0.2.0-preview2).
pkgname=horneroctl-bin
_reltag=horneroctl-v0.2.0-preview33
pkgver=0.2.0_preview33
pkgrel=1
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
sha256sums_x86_64=('9a09909dcb27b163b5c2c93345e50bf137f37c9a4e3de85d73d7a82c6b2c28f0' '34dec161c3aee66c8e3fd70c567c070eb5f9e9d3f6462eb0f10097f6bed842ce')
sha256sums_aarch64=('f79a35caede2942676bb27f05e81f2d46307866022f01e03aa8e880149412cb6' 'c31849b31ed79caeb576498e6d0932ceabe3259660f7408fcff16b463bd6c0f2')

package() {
  install -Dm755 "${srcdir}/horneroctl-${pkgver}" "${pkgdir}/usr/bin/horneroctl"
}
