# Maintainer: Setpill
pkgname=lnd-bin
_pkgname=lnd
pkgver=0.11.1_beta
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
    '4de14833800619124b5860e14249f22ea2ca1a866694d1031b2f439d409dd56903e12e2a4af53cd674a642d1b0190aa840bff42a2ca2351acceed4f8569e3c4e'
    'SKIP'
    'SKIP'
    '9837c5d097a2838cf6dc992cc25b9e94946e401131e13e66a699077c3e2de1b89fb1de71027d46d7230464ebbad3ae8df118d459961b28995677d56fded451ca'
)

# Run curl https://keybase.io/bitconner/pgp_keys.asc | gpg --import
# But of course don't trust this rando AUR comment - verify yourself that this pubkey belongs to cfromknecht.
validpgpkeys=('9C8D61868A7C492003B2744EE7D737B67FA592C7')

prepare() {
    sha256sum --ignore-missing -c "manifest-v$_pkgver.txt"
}

package() {
    install -Dm 755 "$srcdir/$_pkgname-linux-amd64-v$_pkgver/lncli" -t "$pkgdir/usr/bin";
    install -Dm 755 "$srcdir/$_pkgname-linux-amd64-v$_pkgver/lnd" -t "$pkgdir/usr/bin";

    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

