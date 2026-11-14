# Maintainer: Omni <team@omni.dev>
#
# pkgver is `<Cargo.toml version>.<build number>`; the build number is the
# release workflow's run number, which names the `cli-v<N>` release tag and is
# printed by `fractal --version` as "(build N, <sha>)". The release workflow
# rewrites pkgver and the checksums on every release
pkgname=omnidotdev-fractal-cli-bin
pkgver=0.1.0.12
pkgrel=1
pkgdesc="CLI for Fractal, the Omni deployment platform (pre-built)"
arch=('x86_64' 'aarch64')
url="https://fractal.omni.dev"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=('omnidotdev-fractal-cli')
# Both install /usr/bin/fractal: the Arch `fractal` package is an unrelated Matrix client
conflicts=('omnidotdev-fractal-cli' 'fractal')
options=('!debug')
_build=${pkgver##*.}
_release="https://github.com/omnidotdev/fractal-cli/releases/download/cli-v${_build}"
source=("${pkgname}-${pkgver}-LICENSE.md::https://raw.githubusercontent.com/omnidotdev/fractal-cli/cli-v${_build}/LICENSE.md")
# Both arches download to the same name; makepkg only fetches the one for $CARCH
source_x86_64=("${pkgname}-${pkgver}::${_release}/fractal-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}::${_release}/fractal-linux-arm64")
sha256sums=('64d90764a9baac9d5f0797d6d9a7dfb26823396df09c872557e971cf76cc0a92')
sha256sums_x86_64=('81e699c92e02d43bb2e5295da6638dee40de57138bb8ead820619396dc8c4d1d')
sha256sums_aarch64=('c21d785aeed80d8ffc0b671147414caba561a7300fedc1ed25519710d74a09dd')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/fractal"
  install -Dm644 "${pkgname}-${pkgver}-LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
