# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-agent-systemd-creds-unstable-bin
pkgver=0.8.15
pkgrel=1
pkgdesc="Moshpit agent daemon — systemd credentials unlock with post-quantum ML-DSA support (pre-compiled MUSL static binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
provides=('moshpit-agent')
conflicts=('moshpit-agent' 'moshpit-agent-systemd-creds' 'moshpit-agent-bin' 'moshpit-agent-fido2-bin'
           'moshpit-agent-systemd-creds-bin' 'moshpit-agent-ssh-agent-piggyback-bin'
           'moshpit-agent-full-bin' 'moshpit-agent-unstable-bin' 'moshpit-agent-fido2-unstable-bin'
           'moshpit-agent-ssh-agent-piggyback-unstable-bin' 'moshpit-agent-full-unstable-bin')
depends=()
makedepends=()

_base="https://github.com/rustyhorde/moshpit/releases/download/v${pkgver}"

source=("${_base}/dist-mpa.tar.gz")
source_x86_64=("mpa-systemd-creds-unstable-x86_64::${_base}/mpa-systemd-creds-unstable-x86_64-unknown-linux-musl")
source_aarch64=("mpa-systemd-creds-unstable-aarch64::${_base}/mpa-systemd-creds-unstable-aarch64-unknown-linux-musl")
sha256sums=('d1021a091ea4a557a82d290b289ef6be394d6160d36a89437dca0bb9e6dc5239')
sha256sums_x86_64=('f866ff2e49d9016ac26922d17ce75c861f92db4f950989b1c8f6dfa688c159e3')
sha256sums_aarch64=('f9c37316db7918d2df70c12b9fbde0f6429dbd294d8fd2cdd33222b2d57d823a')

package() {
    install -Dm755 "mpa-systemd-creds-unstable-${CARCH}" "$pkgdir/usr/bin/mpa"

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
