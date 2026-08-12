# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=beardrive-bin
_pkgname=beardrive
pkgver=0.15.0
pkgrel=2
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
sha256sums_x86_64=('96ee946708ff62f1d4f349fd06faeb1bd82d058eaff7c5f14d01903ecb70e240')
sha256sums_aarch64=('85597ad92ba8e78e3dc2bab884876af3f2afe537efcd203942c13c5620686ac2')

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
