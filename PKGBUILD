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
pkgver=0.81.0
pkgrel=1
pkgdesc='Secure, kernel-enforced sandbox for AI agents, MCP servers and LLM workloads using Landlock (pre-built binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/nolabs-ai/nono'
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
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/nolabs-ai/nono/v${pkgver}/LICENSE"
  "README-${pkgver}.md::https://raw.githubusercontent.com/nolabs-ai/nono/v${pkgver}/README.md"
)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/nolabs-ai/nono/releases/download/v${pkgver}/nono-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/nolabs-ai/nono/releases/download/v${pkgver}/nono-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('7310e9389f298b89bb2f90ac4b6081ed5b6a1c4a7b8547df5d52966a57cb0929'
            '2dbc355b4d9a378d9de9909c108899f92497242e024fa4a5dc00d56c286225ff')
sha256sums_x86_64=('7ecc33ff9c349bdfa84b4496e7a7555f67bcc33f1e125c7df9efb653c6c4e569')
sha256sums_aarch64=('a4d87ddb0917ef96224bcc41a2587318d7d0e92441e7ff454696e5980c9f7924')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
