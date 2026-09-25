# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=beardrive-bin
_pkgname=beardrive
pkgver=0.16.1
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
sha256sums_x86_64=('56bc18b015d17ede8dd5fc8cfb8852314b71e409b7a3a7a752495d5b7d854edc')
sha256sums_aarch64=('1ddcaec4efd91c75c76c72561b627f138638c082d5fdd2fc97de562ac3172551')

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
