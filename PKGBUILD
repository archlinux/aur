# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-agent-full-bin
pkgver=0.8.17
pkgrel=1
pkgdesc="Moshpit agent daemon — all MUSL-portable unlock backends: FIDO2, systemd-creds, SSH agent (pre-compiled static binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
provides=('moshpit-agent')
conflicts=('moshpit-agent' 'moshpit-agent-bin' 'moshpit-agent-fido2-bin'
           'moshpit-agent-systemd-creds-bin' 'moshpit-agent-ssh-agent-piggyback-bin')
depends=()
makedepends=()

_base="https://github.com/rustyhorde/moshpit/releases/download/v${pkgver}"

source=("${_base}/dist-mpa.tar.gz")
source_x86_64=("mpa-full-x86_64::${_base}/mpa-full-x86_64-unknown-linux-musl")
source_aarch64=("mpa-full-aarch64::${_base}/mpa-full-aarch64-unknown-linux-musl")
sha256sums=('5e03a37fba9b52f30892f54416008c01ff834cb9c5f8d6b28b3b73be8b1f2f21')
sha256sums_x86_64=('3d0651b57b5f613ab09ffcedadc9789eedc4e2835ae65d90237dd62195cc9501')
sha256sums_aarch64=('337d3cfac42217288eee2b1eb8d01e90427514cf8026607474537b3261a4e47b')

package() {
    install -Dm755 "mpa-full-${CARCH}" "$pkgdir/usr/bin/mpa"

    install -Dm644 mpa/mpa.1 "$pkgdir/usr/share/man/man1/mpa.1"
    install -Dm644 mpa/mpa.bash \
        "$pkgdir/usr/share/bash-completion/completions/mpa"
    install -Dm644 mpa/_mpa \
        "$pkgdir/usr/share/zsh/site-functions/_mpa"
    install -Dm644 mpa/mpa.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/mpa.fish"
    install -Dm644 mpa/moshpit-agent.service \
        "$pkgdir/usr/lib/systemd/user/moshpit-agent.service"
    install -Dm644 mpa/moshpit-agent.socket \
        "$pkgdir/usr/lib/systemd/user/moshpit-agent.socket"
    install -Dm644 mpa/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 mpa/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
