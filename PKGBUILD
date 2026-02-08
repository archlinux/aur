# Maintainer: Oliver Ford <dev.aur@ojford.com>
pkgname=claude-code-seccomp
pkgver=0.0.35
pkgrel=1
pkgdesc='seccomp filter dependency for Claude Code /sandbox'

arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/anthropic-experimental/sandbox-runtime'
license=('Apache-2.0')
install=claude-code-seccomp.install

_commit=4fad8fa35db3f09958db1df401b30bd00402b611
_rawurl="https://raw.githubusercontent.com/anthropic-experimental/sandbox-runtime/${_commit}/vendor/seccomp"

source_x86_64=(
    "apply-seccomp-${pkgver}::${_rawurl}/x64/apply-seccomp"
    "unix-block-${pkgver}.bpf::${_rawurl}/x64/unix-block.bpf"
)
source_aarch64=(
    "apply-seccomp-${pkgver}::${_rawurl}/arm64/apply-seccomp"
    "unix-block-${pkgver}.bpf::${_rawurl}/arm64/unix-block.bpf"
)

sha256sums_x86_64=(
    'e70346b63797e7dbc9835da321e4f0f8aaee721fd1a58754f3d8a61bd80b98fd'
    'c4d15960d54267934db13ab39bac3938cd5045d370ab8eee7023cd9a4e868807'
)
sha256sums_aarch64=(
    '74ae36efaa06865de565f023b7c474668018d65715638e008f8b51bf95e1107d'
    '439626767f5e2159b0eb1351bd5c71ce95c0c88badf0a954a527acd9e796555c'
)

package() {
    install -Dm755 "apply-seccomp-${pkgver}" "${pkgdir}/usr/lib/claude-code-seccomp/apply-seccomp"
    install -Dm644 "unix-block-${pkgver}.bpf" "${pkgdir}/usr/lib/claude-code-seccomp/unix-block.bpf"
}
