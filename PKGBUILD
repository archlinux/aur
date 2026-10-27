# Maintainer: David Hrabě <david.hrabe@almamedia.com>

pkgname=dependabot-cli-bin
pkgver=1.96.0 # renovate: datasource=github-releases depName=dependabot/cli
pkgrel=1
pkgdesc="Run Dependabot update jobs from the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/dependabot/cli"
license=('MIT')
depends=('glibc' 'docker' 'ca-certificates')
provides=('dependabot-cli' 'dependabot')
conflicts=('dependabot-cli' 'dependabot')
options=('!strip' '!debug')
source=("dependabot-cli-${pkgver}-LICENSE::https://raw.githubusercontent.com/dependabot/cli/v${pkgver}/LICENSE")
source_x86_64=("https://github.com/dependabot/cli/releases/download/v${pkgver}/dependabot-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/dependabot/cli/releases/download/v${pkgver}/dependabot-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('0e7b78f37c1ba58f8287e556c1a48dbf477b467f88ec300537af3fef2451a6ff')
sha256sums_x86_64=('44bec839eb57d24a7a8aec36d3cd3d97dc12a99d2b8fb23637add6f4f8142613')
sha256sums_aarch64=('14e2a8fdddcd7749c428b42040ec42521e71c00c9a0aa11b6b17cfada94317ab')

build() {
    ./dependabot completion bash > dependabot.bash
    ./dependabot completion zsh > dependabot.zsh
    ./dependabot completion fish > dependabot.fish
}

check() {
    ./dependabot --version | grep -Fx "dependabot version v${pkgver}"
}

package() {
    install -Dm755 dependabot "${pkgdir}/usr/bin/dependabot"
    install -Dm644 "dependabot-cli-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 dependabot.bash "${pkgdir}/usr/share/bash-completion/completions/dependabot"
    install -Dm644 dependabot.zsh "${pkgdir}/usr/share/zsh/site-functions/_dependabot"
    install -Dm644 dependabot.fish "${pkgdir}/usr/share/fish/vendor_completions.d/dependabot.fish"
}
