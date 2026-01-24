# Maintainer: Varalys <chris@varalys.com>
pkgname=lore-cli-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="Reasoning history for code - captures AI-assisted development sessions and links them to git commits"
arch=('x86_64' 'aarch64')
url="https://github.com/varalys/lore"
license=('Apache-2.0')
provides=('lore-cli' 'lore')
conflicts=('lore-cli' 'lore')
depends=('gcc-libs')
options=(!debug)
install=lore-cli-bin.install

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/varalys/lore/releases/download/v${pkgver}/lore-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/varalys/lore/releases/download/v${pkgver}/lore-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('f3ebb95fc954320091420333ebc5a065a38a5f9b64924e91b9b61730b92a8f74')
sha256sums_aarch64=('9e5894f01f2eb1727efe433df89c56d1b56be85de6409ef70a2402ee2c516cc6')

package() {
    install -Dm755 lore "${pkgdir}/usr/bin/lore"

    # Generate and install shell completions
    "${srcdir}/lore" completions bash > lore.bash
    "${srcdir}/lore" completions zsh > _lore
    "${srcdir}/lore" completions fish > lore.fish

    install -Dm644 lore.bash "${pkgdir}/usr/share/bash-completion/completions/lore"
    install -Dm644 _lore "${pkgdir}/usr/share/zsh/site-functions/_lore"
    install -Dm644 lore.fish "${pkgdir}/usr/share/fish/vendor_completions.d/lore.fish"
}
