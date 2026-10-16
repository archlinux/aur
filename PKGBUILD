# Maintainer: bermudi <github.igizp@dabg.uk>
# Auto-updated by GitHub Actions (see .github/workflows/opencode2-bin.yml)

pkgname=opencode2-bin
pkgver=2.0.30
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
arch=('aarch64' 'x86_64')
url='https://opencode.ai'
license=('MIT')
provides=('opencode2')
conflicts=('opencode2')
depends=('glibc')
options=('!debug' '!strip')

# opencode v2 has no GitHub releases — it ships per-arch binaries to npm.
# 2026-10-08: upstream moved scope @opencode-ai/* -> @opencode/* (the old
# scope went silent 2026-09-07) and v2 went stable: the `latest` dist-tag of
# @opencode/cli now carries semver 2.0.x (the `beta`/`dev` tags still carry
# build-numbered prereleases). We track `latest`.
# Prerelease versions use dashes (`0.0.0-beta-19271`), which map to `_` for
# pkgver; `_npmver` below reverses that for URLs.
_npmver="${pkgver//_/-}"

# Update workflow rewrites pkgver, resets pkgrel, and rewrites the checksum
# entries below (hex sha512, derived from the npm `dist.integrity` field).
# Everything else here is static — do not hand-merge this file from a template.
source_x86_64=("${pkgname}_${pkgver}_x86_64.tgz::https://registry.npmjs.org/@opencode/cli-linux-x64/-/cli-linux-x64-${_npmver}.tgz")
sha512sums_x86_64=('a01c3c76d83d05688a921c8f3b103a18dfa8efcce641f8e0562ec7cfd75ed69259255c8604c2e59189351303de4bebd6c8e0926adcb6171080b181f56cc752da')
source_aarch64=("${pkgname}_${pkgver}_aarch64.tgz::https://registry.npmjs.org/@opencode/cli-linux-arm64/-/cli-linux-arm64-${_npmver}.tgz")
sha512sums_aarch64=('110cd5038d235a46d831019da82df2ec8ec33949f0e736213cfc026b6bc56ff30afc1b8190766a3dcb030010fcd8409a355189a38de4cfcb340a4a1d6fc100e3')

package() {
  # 2.0.x renamed the shipped binary bin/opencode2 -> bin/opencode. We still
  # install it as /usr/bin/opencode2: upstream's npm bin-map keeps the
  # `opencode2` alias, and /usr/bin/opencode belongs to the still-maintained
  # v1 `opencode-bin` package (different maintainer, different major).
  install -Dm755 "$srcdir/package/bin/opencode" "$pkgdir/usr/bin/opencode2"
}
