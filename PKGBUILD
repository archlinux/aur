# Maintainer: sarovin86 <sarovin86@gmail.com>
# Maintainer: Luke Hinds (lukehinds)
#
# This PKGBUILD is the canonical source for the nono-ai-bin AUR package.
# It is published to the AUR automatically by .github/workflows/aur-publish.yml
# on each upstream release: pkgver and the sha256sums arrays are rewritten at
# publish time by packaging/aur/update.sh, so the values committed here may lag
# behind the latest release. The committed values always correspond to a real
# release, so this file remains locally buildable with makepkg.

pkgname=nono-ai-bin
_pkgname=nono
pkgver=0.67.0
pkgrel=1
pkgdesc='Secure, kernel-enforced sandbox for AI agents, MCP servers and LLM workloads using Landlock (pre-built binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/always-further/nono'
license=('Apache-2.0')
# dbus is intentionally not a hard dependency: the release binary does not
# link libdbus (pure-Rust zbus keyring backend, verified in release.yml).
# D-Bus is only needed at runtime for the optional Secret Service keyring,
# and both optdepends below already pull it in.
depends=('glibc' 'libgcc')
optdepends=(
  'gnome-keyring: Secret Service daemon for credential storage'
  'keepassxc: alternative Secret Service daemon'
)
provides=('nono-ai')
conflicts=("${_pkgname}" 'nono-ai' 'nono-ai-git')
options=('!strip' '!debug')
source=(
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/always-further/nono/v${pkgver}/LICENSE"
  "README-${pkgver}.md::https://raw.githubusercontent.com/always-further/nono/v${pkgver}/README.md"
)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/always-further/nono/releases/download/v${pkgver}/nono-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/always-further/nono/releases/download/v${pkgver}/nono-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('7310e9389f298b89bb2f90ac4b6081ed5b6a1c4a7b8547df5d52966a57cb0929'
            '6faf919f0970c9c44956bb4df1c5d4c0b5c98d482b5a36699098bf47695b9d2e')
sha256sums_x86_64=('93884b31fc2362b2ffea23c81961c8888fab74095fb2089a68e2b67d8d66b961')
sha256sums_aarch64=('767a4f2e00bfad63c365aa003231b83c8730148c95f085d8992f4438bba84bcd')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
