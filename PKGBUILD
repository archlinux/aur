# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-agent-full-bin
pkgver=0.9.1
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
sha256sums=('dd21b66fbb5926de40eecab01d818b842bc396a8467803a31f0a1287b2bc58e7')
sha256sums_x86_64=('009d5c934e8f3013ea76c7049b056ee5d13ce38871e1b03df30921d2509dbb6d')
sha256sums_aarch64=('fd64e7c37711fc64a0a906170b9b4ad9e1a912c558bd6b6fa18c9912abab0e9d')

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
