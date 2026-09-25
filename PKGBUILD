# Maintainer: colegeming <collegeming@outlook.com>

pkgname=kimi-code-bin
pkgver=2.1.1
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
source_x86_64=(
    "https://github.com/MoonshotAI/kimi-code/releases/download/%40moonshot-ai/kimi-code%402.1.1/kimi-code-linux-x64.tar.gz"
    'LICENSE::https://raw.githubusercontent.com/MoonshotAI/kimi-code/main/LICENSE'
)
sha256sums_x86_64=(
    'b66cc3787bc9dfa6a06761305dc8878f98e7a24f79fa4494c00714229a1486e8'
    '23cc68e17992e0b512ae2e80afc5787d7d8e0fbfbdb4fff54ec0245508fa400e'
)
source_aarch64=(
    "https://github.com/MoonshotAI/kimi-code/releases/download/%40moonshot-ai/kimi-code%402.1.1/kimi-code-linux-arm64.tar.gz"
    'LICENSE::https://raw.githubusercontent.com/MoonshotAI/kimi-code/main/LICENSE'
)
sha256sums_aarch64=(
    '5c68d74b139b47fb3457f3805a159cdfa942a6a98a159ab158a1baf93b024bbd'
    '23cc68e17992e0b512ae2e80afc5787d7d8e0fbfbdb4fff54ec0245508fa400e'
)

package() {
    # Each tarball holds a single self-contained `kimi` executable.
    install -Dm755 "${srcdir}/kimi" "${pkgdir}/usr/bin/kimi"
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
