# Maintainer: colegeming <collegeming@outlook.com>

pkgname=kimi-code-bin
pkgver=2.6.2
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
    "kimi-code-${pkgver}-linux-x64.tar.gz::https://github.com/MoonshotAI/kimi-code/releases/download/%40moonshot-ai/kimi-code%402.6.2/kimi-code-linux-x64.tar.gz"
    "kimi-code-${pkgver}-LICENSE::https://raw.githubusercontent.com/MoonshotAI/kimi-code/%40moonshot-ai%2Fkimi-code%402.6.2/LICENSE"
)
sha256sums_x86_64=(
    '4674a0f54c055336b497bab1502684c718819e7896cb895a2999f5dcc3960387'
    '23cc68e17992e0b512ae2e80afc5787d7d8e0fbfbdb4fff54ec0245508fa400e'
)
source_aarch64=(
    "kimi-code-${pkgver}-linux-arm64.tar.gz::https://github.com/MoonshotAI/kimi-code/releases/download/%40moonshot-ai/kimi-code%402.6.2/kimi-code-linux-arm64.tar.gz"
    "kimi-code-${pkgver}-LICENSE::https://raw.githubusercontent.com/MoonshotAI/kimi-code/%40moonshot-ai%2Fkimi-code%402.6.2/LICENSE"
)
sha256sums_aarch64=(
    '34e0e1d1ce7f82a2e7fdf6142ddacd543e15c524df2966512145099c2236e92b'
    '23cc68e17992e0b512ae2e80afc5787d7d8e0fbfbdb4fff54ec0245508fa400e'
)

package() {
    # Each tarball holds a single self-contained `kimi` executable.
    install -Dm755 "${srcdir}/kimi" "${pkgdir}/usr/bin/kimi"
    install -Dm644 "${srcdir}/kimi-code-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
