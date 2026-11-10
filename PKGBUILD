# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=beardrive-bin
_pkgname=beardrive
pkgver=0.18.8
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
sha256sums_x86_64=('8dcb93a1e16d571ed05bcb9866e5afe0cd8edcfdd12aa9d8d74b47401cf44de7')
sha256sums_aarch64=('c61bfed2203b4b4216b894e99596bd80230e1a89d2e3617af83eb619aa03d824')

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
