# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-agent-ssh-agent-piggyback-unstable-bin
pkgver=0.8.14
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
sha256sums=('2509d51a72f32ad585ca1239d49f9e6c0923052a9b91e98108615913fba24acd')
sha256sums_x86_64=('203a5620174c962945ee8358f05c833898dd0606b07189d7c3ffeae7eada2ca3')
sha256sums_aarch64=('a8102a566c8cccd953f5b73f780b4379239abb995915aa835e579e69aed958f2')

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
