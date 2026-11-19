# Maintainer: czyt <czytcn@gmail.com>
pkgname=agent-access-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Bitwarden Agent Access: give a remote agent or script credentials from your vault over an end-to-end encrypted tunnel, without exposing the rest of it"
arch=('x86_64')
url="https://github.com/bitwarden/agent-access"
license=('Apache-2.0')
# A Rust build: the only libraries outside glibc are OpenSSL 3 and libgcc_s.
depends=('gcc-libs' 'glibc' 'openssl')
provides=('agent-access' 'aac')
conflicts=('agent-access')
options=('!strip' '!debug')

# The release file has a fixed name, so the local name carries the version and
# makepkg cannot serve an older download from its cache.
_archive="aac-${pkgver}-linux-${CARCH}.tar.gz"

source=("${_archive}::https://github.com/bitwarden/agent-access/releases/download/v${pkgver}/aac-linux-x86_64.tar.gz"
        "LICENSE.txt::https://raw.githubusercontent.com/bitwarden/agent-access/v${pkgver}/LICENSE.txt")
sha256sums=('a05b35bcc2cb9c87bc32c2ffaf83a1e8f29ac32590e609621f92e8b94d86e368'
            '05ac42df10ae6a3ba4a83e73a015c4c8febeb6650c1a29be8274742c6577a032')

package() {
    install -Dm755 "${srcdir}/aac" "${pkgdir}/usr/bin/aac"
    # The tarball carries no licence text, so it comes from the same tag.
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
