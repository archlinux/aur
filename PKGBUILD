# Maintainer: 0chroma <me at chroma dot sh>
# Upstream installer: https://go.minimal.dev/install.sh

pkgname=minimal-bin
pkgver=3949779
pkgrel=1
pkgdesc="A declarative build system, developer environment tool, and task runner"
arch=(x86_64 aarch64)
url="https://minimal.dev"
# License: custom proprietary license
license=("LicenseRef-Minimal-Proprietary")
depends=(git)
makedepends=(curl)
optdepends=(
    "bash: shell integration and completions"
    "zsh: shell integration and completions"
    "fish: shell integration and completions"
)
source_x86_64=("https://storage.googleapis.com/minimal-shim/archives/cli-amd64-linux-${pkgver}.tar.zst")
source_aarch64=("https://storage.googleapis.com/minimal-shim/archives/cli-arm64-linux-${pkgver}.tar.zst")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

pkgver() {
    curl -sL "https://storage.googleapis.com/minimal-shim/config/cli-amd64-linux.json" \
        | sed -n 's/.*"version":"\([^"]*\)".*/\1/p'
}

package() {
    # Install the CLI binary as /usr/bin/minimal
    install -Dm755 "bin/minimal" \
        "${pkgdir}/usr/bin/minimal"

    # Install custom license
    install -Dm644 "LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install pre-packaged completions
    # Bash completions
    install -Dm644 "completions/bash/minimal" \
        "${pkgdir}/usr/share/bash-completion/completions/minimal"

    # Zsh completions
    install -Dm644 "completions/zsh/_minimal" \
        "${pkgdir}/usr/share/zsh/site-functions/_minimal"

    # Fish completions
    install -Dm644 "completions/fish/minimal.fish" \
        "${pkgdir}/usr/share/fish/vendor_completions.d/minimal.fish"
}
