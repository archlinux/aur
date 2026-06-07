# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-agent-full-bin
pkgver=0.8.20
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
sha256sums=('b1e3af29a86c8275d56d1f2d8e3b71af14a75b490270ca626b517e547ee018dd')
sha256sums_x86_64=('63645292c5e5be8b71cc51eba6be9b6274561c5e784aeb91887d71a4ea3856be')
sha256sums_aarch64=('f7b794b872942cd876b3cd4130b034588be62e9178de126f68aa94edbea628a8')

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
