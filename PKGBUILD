# Maintainer: miaoermua <miaoermua@gmail.com>
# Updated for native pacman package support with multi-arch

_pkgname=splayer
pkgname=splayer
pkgver=3.0.0_beta.3
pkgrel=1
pkgdesc="Splayer | A minimalist music player"
arch=('x86_64' 'aarch64')
url="https://github.com/imsyy/SPlayer"
license=("AGPL-3.0-only")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=()
options=(!strip !debug)

if [ "$CARCH" = "x86_64" ]; then
    _arch_pkg="x64"
    _sha256="93e1612a817e95eb1319caf80e46dc817bf75f4f6f0ea1e287c5903d9c2febf1"
elif [ "$CARCH" = "aarch64" ]; then
    _arch_pkg="aarch64"
    _sha256="9df6397dda274fcdbf9d47220e54f50252c3dbc1627b303b018eb5c10d703af9"
else
    error "Unsupported architecture: $CARCH"
    exit 1
fi

source=("https://github.com/imsyy/SPlayer/releases/download/v${pkgver//_/-}/splayer-${pkgver//_/-}-${_arch_pkg}.pacman")
sha256sums=("${_sha256}")

noextract=("${source[0]##*/}")

package() {
    msg2 "Extracting native pacman package for $CARCH..."
    bsdtar -x -f "${srcdir}/${source[0]##*/}" -C "$pkgdir" --exclude .PKGINFO --exclude .MTREE --exclude .INSTALL
}