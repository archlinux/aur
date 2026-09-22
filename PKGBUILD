# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=beardrive-bin
_pkgname=beardrive
pkgver=0.16.0
pkgrel=1
pkgdesc='Synced file system for AI agents to mount, sync, and track folders'
arch=('x86_64' 'aarch64')
url='https://github.com/runbear-io/beardrive'
license=('AGPL-3.0-only')
install=beardrive-bin.install
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=('ca-certificates')
optdepends=(
    'git: detect the author email from Git configuration'
    'xdg-utils: open the browser during login'
)

_base="${url}/releases/download/v${pkgver}"
source_x86_64=("${_base}/beardrive_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_base}/beardrive_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('febd8c261691c84ace21b5765a03a4c89e6b7fab83f8b4627a1b74cb97d61e85')
sha256sums_aarch64=('d6005b938dd27962f395a0d5095af0b326d3e09ecb81d9e94f1de63a7395fca8')

package() {
    install -Dm755 bdrive "${pkgdir}/usr/bin/bdrive"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

    "${srcdir}/bdrive" completion bash | install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/bash-completion/completions/bdrive"
    "${srcdir}/bdrive" completion zsh | install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/zsh/site-functions/_bdrive"
    "${srcdir}/bdrive" completion fish | install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/fish/vendor_completions.d/bdrive.fish"
}
