# Maintainer: bermudi <github.igizp@dabg.uk>
# Auto-updated by GitHub Actions (see .github/workflows/opencode2-bin.yml)

pkgname=opencode2-bin
pkgver=2.0.28
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
sha512sums_x86_64=('1dd810d9cf45ac447cf30dc0966fd419dcd4e79942734157c529be54d317533f98cafd37b8b73467e3f14a7101cac99834a705bdc9f1753eded3118fa32b6b36')
source_aarch64=("${pkgname}_${pkgver}_aarch64.tgz::https://registry.npmjs.org/@opencode/cli-linux-arm64/-/cli-linux-arm64-${_npmver}.tgz")
sha512sums_aarch64=('04e8d764cb6f62243dc68c1f1d726c780467ef01cdf114ef46f62f30c22c8c838424e62dbf868fbc1e25d019a69e1504859420ae9acf15a9a4503cb49438988b')

package() {
  # 2.0.x renamed the shipped binary bin/opencode2 -> bin/opencode. We still
  # install it as /usr/bin/opencode2: upstream's npm bin-map keeps the
  # `opencode2` alias, and /usr/bin/opencode belongs to the still-maintained
  # v1 `opencode-bin` package (different maintainer, different major).
  install -Dm755 "$srcdir/package/bin/opencode" "$pkgdir/usr/bin/opencode2"
}
