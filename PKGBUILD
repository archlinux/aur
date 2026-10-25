# Maintainer: colegeming <collegeming@outlook.com>

pkgname=kimi-code-bin
pkgver=2.3.2
pkgrel=1
pkgdesc='Kimi Code CLI - the starting point for next-gen agents (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/MoonshotAI/kimi-code'
license=('MIT')
# Bun-compiled glibc binary: glibc for libc/libdl/libm/libpthread, gcc-libs for
# libstdc++/libgcc_s. No Node.js runtime needed, unlike the npm-based
# `kimi-code` package.
depends=('glibc' 'gcc-libs')
provides=('kimi-code')
# kimi-cli and kimi-cli-bin also install /usr/bin/kimi -- kimi-code is the
# successor of that older Python CLI -- so declare the clash instead of
# failing on an unexplained file conflict.
conflicts=('kimi-code' 'kimi-cli')
options=('!strip')
# The LICENSE is not part of any release asset, so it is pinned here from the
# default branch; refresh its sha256 only if upstream changes that file.
# Source local names are version-tagged (filename::url syntax) because the
# upstream asset names are version-independent ("kimi-code-linux-x64.tar.gz"
# for every release). Without the rename, makepkg/yay reuse the previous
# version's cached download under the same filename and the sha256 check
# fails on every upgrade.
#
# LICENSE comes from the repo at the release tag (see [extras] in
# metadata.toml); its URL and checksum are filled in by the updater.
source_x86_64=(
    "kimi-code-${pkgver}-linux-x64.tar.gz::https://github.com/MoonshotAI/kimi-code/releases/download/%40moonshot-ai/kimi-code%402.3.2/kimi-code-linux-x64.tar.gz"
    "kimi-code-${pkgver}-LICENSE::https://raw.githubusercontent.com/MoonshotAI/kimi-code/%40moonshot-ai%2Fkimi-code%402.3.2/LICENSE"
)
sha256sums_x86_64=(
    '4715ccd1a591b64683929a14b26b3d07ac4c484e4da3881b22a2ccca56304042'
    '23cc68e17992e0b512ae2e80afc5787d7d8e0fbfbdb4fff54ec0245508fa400e'
)
source_aarch64=(
    "kimi-code-${pkgver}-linux-arm64.tar.gz::https://github.com/MoonshotAI/kimi-code/releases/download/%40moonshot-ai/kimi-code%402.3.2/kimi-code-linux-arm64.tar.gz"
    "kimi-code-${pkgver}-LICENSE::https://raw.githubusercontent.com/MoonshotAI/kimi-code/%40moonshot-ai%2Fkimi-code%402.3.2/LICENSE"
)
sha256sums_aarch64=(
    '87913f7a00af125202d4dea3ae6a3c77a41f616f1aac89c11cadb9efc966800d'
    '23cc68e17992e0b512ae2e80afc5787d7d8e0fbfbdb4fff54ec0245508fa400e'
)

package() {
    # Each tarball holds a single self-contained `kimi` executable.
    install -Dm755 "${srcdir}/kimi" "${pkgdir}/usr/bin/kimi"
    install -Dm644 "${srcdir}/kimi-code-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
