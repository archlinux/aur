# Maintainer: Omni <team@omni.dev>
#
# pkgver is `<Cargo.toml version>.<build number>`; the build number is the
# release workflow's run number, which names the `cli-v<N>` release tag and is
# printed by `fractal --version` as "(build N, <sha>)". The release workflow
# rewrites pkgver and the checksums on every release
pkgname=omnidotdev-fractal-cli-bin
pkgver=0.1.0.11
pkgrel=1
pkgdesc="CLI for Fractal, the Omni deployment platform (pre-built)"
arch=('x86_64' 'aarch64')
url="https://fractal.omni.dev"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=('omnidotdev-fractal-cli')
# Both install /usr/bin/fractal: the Arch `fractal` package is an unrelated Matrix client
conflicts=('omnidotdev-fractal-cli' 'fractal')
options=('!debug')
_build=${pkgver##*.}
_release="https://github.com/omnidotdev/fractal-cli/releases/download/cli-v${_build}"
source=("${pkgname}-${pkgver}-LICENSE.md::https://raw.githubusercontent.com/omnidotdev/fractal-cli/cli-v${_build}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_release}/fractal-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_release}/fractal-linux-arm64")
sha256sums=('64d90764a9baac9d5f0797d6d9a7dfb26823396df09c872557e971cf76cc0a92')
sha256sums_x86_64=('10171632eceb0c5e90e86644d75625cc52aad5f0130d8eb1b6dd8eaa7f7d2a48')
sha256sums_aarch64=('10be337091a2a2df49a9ef6b556841c6b15ec953f3df134fa974cf2cb911a051')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/fractal"
  install -Dm644 "${pkgname}-${pkgver}-LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
