# Maintainer: Setpill
pkgname=lnd-bin
_pkgname=lnd
pkgver=0.8.1_beta
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
    'b51258b5c14487b97d4c0e9f08ec45407609fc70fcd05e5c9123534f0e8b7f0e2d7f3ac6df4786e0db3e230e0f9951dbf12f890d2a625158d1487323bb5afc95'
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

