# Maintainer: Setpill
pkgname=lnd-bin
_pkgname=lnd
pkgver=0.9.0_beta
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Lightning Network Daemon ⚡"
arch=('x86_64')
url="https://github.com/lightningnetwork/lnd"
license=('MIT')
provides=('lnd' 'lncli')
conflicts=('lnd' 'lnd-git')
source=(
    "https://github.com/lightningnetwork/lnd/releases/download/v$_pkgver/$_pkgname-linux-amd64-v$_pkgver.tar.gz"
    "https://github.com/lightningnetwork/lnd/releases/download/v$_pkgver/manifest-v$_pkgver.txt"
    "https://github.com/lightningnetwork/lnd/releases/download/v$_pkgver/manifest-v$_pkgver.txt.sig"
    "https://raw.githubusercontent.com/lightningnetwork/lnd/v$_pkgver/LICENSE"
)
sha512sums=(
    'bb9d7722621448e78578a50d9f5f9a25ae05bb6f15e8b510ac383a6febc862d5d57a427b4cb0d5a83e13f4f3c23a5d715b8861c70078a7caec2e1db23d266381'
    'SKIP'
    'SKIP'
    '9837c5d097a2838cf6dc992cc25b9e94946e401131e13e66a699077c3e2de1b89fb1de71027d46d7230464ebbad3ae8df118d459961b28995677d56fded451ca'
)

# Run curl https://keybase.io/roasbeef/pgp_keys.asc | gpg --import
# But of course don't trust this rando AUR comment - verify yourself that this pubkey belongs to roasbeef.
validpgpkeys=('9769140D255C759B1EB77B46A96387A57CAAE94D')

prepare() {
    sha256sum --ignore-missing -c "manifest-v$_pkgver.txt"
}

package() {
    install -Dm 755 "$srcdir/$_pkgname-linux-amd64-v$_pkgver/lncli" -t "$pkgdir/usr/bin";
    install -Dm 755 "$srcdir/$_pkgname-linux-amd64-v$_pkgver/lnd" -t "$pkgdir/usr/bin";

    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

