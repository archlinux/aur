# Maintainer: enihcam <enihcam@archlinux>

# Upstream ships no LICENSE file; the "Important Notice" in the README is the
# sole license grant. It explicitly disallows redistribution, modification, and
# reverse-engineering, which is unusual for AUR but the tarballs themselves are
# publicly downloadable. The README is pinned to the release tag and installed
# as the license text.

pkgname=airwallex-cli
pkgver=0.4.2
pkgrel=2
pkgdesc='CLI for the Airwallex platform (proprietary beta)'
arch=('x86_64' 'aarch64')
url='https://github.com/airwallex/airwallex-cli'
license=('LicenseRef-Airwallex-CLI-EULA')
depends=('glibc')
optdepends=('bash-completion: shell completions (provided by upstream)')
provides=('airwallex')
conflicts=('airwallex')
# Ship the upstream binary byte-for-byte so it matches the published checksum.
options=('!strip')

_rel="https://github.com/airwallex/airwallex-cli/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-README.md::https://raw.githubusercontent.com/airwallex/airwallex-cli/v${pkgver}/README.md")
source_x86_64=("${_rel}/airwallex_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_rel}/airwallex_${pkgver}_linux_arm64.tar.gz")

# Tarball digests must match upstream airwallex-linux-checksums.txt for v${pkgver}.
sha256sums=('cb69fbd14f17d818171bf3e142a08898f68529ace0ebe7dee172a8702bb3298e')
sha256sums_x86_64=('0a9a3e20741ba76a03ef54d873f5f98d1de83a8caccf9feb4f057fb83f2c03f4')
sha256sums_aarch64=('e1cea306ef6094bbab5d1eabdc4ef2dce733f9f7334b1fbf0d7162c75c6282ed')

package() {
  # Tarball layout: a single `airwallex` executable at the archive root.
  install -Dm0755 "$srcdir/airwallex" "$pkgdir/usr/bin/airwallex"
  install -Dm0644 "$srcdir/${pkgname}-${pkgver}-README.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
