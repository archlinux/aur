# Maintainer: miaoermua <miaoermua@gmail.com>
# Updated for native pacman package support with multi-arch

_pkgname=splayer
pkgname=splayer
pkgver=3.0.0_beta.4
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
    _sha256="18b52a96f6804234bd1edd04f127149b4cb04d0d3d0fe555ac68719a31d2f9bb"
elif [ "$CARCH" = "aarch64" ]; then
    _arch_pkg="aarch64"
    _sha256="c5043c0fb5848982807dc06a1ae60576a675bf4367c307ae80c108b95b0ca23a"
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
