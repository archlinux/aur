# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-agent-fido2-unstable-bin
pkgver=0.8.15
pkgrel=1
pkgdesc="Moshpit agent daemon — FIDO2/YubiKey unlock with post-quantum ML-DSA support (pre-compiled MUSL static binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
provides=('moshpit-agent')
conflicts=('moshpit-agent' 'moshpit-agent-fido2' 'moshpit-agent-bin' 'moshpit-agent-fido2-bin'
           'moshpit-agent-systemd-creds-bin' 'moshpit-agent-ssh-agent-piggyback-bin'
           'moshpit-agent-full-bin' 'moshpit-agent-unstable-bin'
           'moshpit-agent-systemd-creds-unstable-bin' 'moshpit-agent-ssh-agent-piggyback-unstable-bin'
           'moshpit-agent-full-unstable-bin')
depends=()
makedepends=()

_base="https://github.com/rustyhorde/moshpit/releases/download/v${pkgver}"

source=("${_base}/dist-mpa.tar.gz")
source_x86_64=("mpa-fido2-unstable-x86_64::${_base}/mpa-fido2-unstable-x86_64-unknown-linux-musl")
source_aarch64=("mpa-fido2-unstable-aarch64::${_base}/mpa-fido2-unstable-aarch64-unknown-linux-musl")
sha256sums=('d1021a091ea4a557a82d290b289ef6be394d6160d36a89437dca0bb9e6dc5239')
sha256sums_x86_64=('b9704f51ed4fddda1ca1799f7bd1b08d789a8531f903b987bc4edc90a478dfba')
sha256sums_aarch64=('299d8eca9e562c1be6cab41a46c3249fba66ebeddc9179a0769cc3dc4bc353ce')

package() {
    install -Dm755 "mpa-fido2-unstable-${CARCH}" "$pkgdir/usr/bin/mpa"

    # Man page
    install -Dm644 mpa/mpa.1 "$pkgdir/usr/share/man/man1/mpa.1"

    # Shell completions
    install -Dm644 mpa/mpa.bash \
        "$pkgdir/usr/share/bash-completion/completions/mpa"
    install -Dm644 mpa/_mpa \
        "$pkgdir/usr/share/zsh/site-functions/_mpa"
    install -Dm644 mpa/mpa.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/mpa.fish"

    # systemd user units
    install -Dm644 mpa/moshpit-agent.service \
        "$pkgdir/usr/lib/systemd/user/moshpit-agent.service"
    install -Dm644 mpa/moshpit-agent.socket \
        "$pkgdir/usr/lib/systemd/user/moshpit-agent.socket"

    # Licenses
    install -Dm644 mpa/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 mpa/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
