# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-agent-ssh-agent-piggyback-unstable-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Moshpit agent daemon — SSH agent piggyback unlock with post-quantum ML-DSA support (pre-compiled MUSL static binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
provides=('moshpit-agent')
conflicts=('moshpit-agent' 'moshpit-agent-ssh-agent-piggyback' 'moshpit-agent-bin' 'moshpit-agent-fido2-bin'
           'moshpit-agent-systemd-creds-bin' 'moshpit-agent-ssh-agent-piggyback-bin'
           'moshpit-agent-full-bin' 'moshpit-agent-unstable-bin' 'moshpit-agent-fido2-unstable-bin'
           'moshpit-agent-systemd-creds-unstable-bin' 'moshpit-agent-full-unstable-bin')
depends=()
makedepends=()

_base="https://github.com/rustyhorde/moshpit/releases/download/v${pkgver}"

source=("${_base}/dist-mpa.tar.gz")
source_x86_64=("mpa-ssh-agent-piggyback-unstable-x86_64::${_base}/mpa-ssh-agent-piggyback-unstable-x86_64-unknown-linux-musl")
source_aarch64=("mpa-ssh-agent-piggyback-unstable-aarch64::${_base}/mpa-ssh-agent-piggyback-unstable-aarch64-unknown-linux-musl")
sha256sums=('21c3945452d2bf1a5a08176cf286621a8f8feb87a0beb636429c0196ddc012a1')
sha256sums_x86_64=('6ac570488bbfc9317b25a1f304bb46b6453d734d775dabb4960a05aaeb8a2d8b')
sha256sums_aarch64=('8b10902b46555d04073a17fae31b4c92e6b03bc2f9fa32ca2b884e84ff088128')

package() {
    install -Dm755 "mpa-ssh-agent-piggyback-unstable-${CARCH}" "$pkgdir/usr/bin/mpa"

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
