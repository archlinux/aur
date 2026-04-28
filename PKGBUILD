# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=edconv-bin
pkgver=1.5.2
pkgrel=2
pkgdesc="A user-friendly FFmpeg GUI"
arch=('x86_64' 'aarch64')
url="https://github.com/edneyosf/Edconv"
license=('GPL-3.0-only')
depends=('ffmpeg' 'fontconfig' 'freetype2' 'libxtst' 'libxi' 'libxrender')
makedepends=('libarchive')
optdepends=('desktop-file-utils: for updating desktop database')
provides=('edconv')
conflicts=('edconv')
options=('!strip' '!debug')

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/edneyosf/Edconv/${pkgver}/LICENSE")
source_x86_64=("Edconv-${pkgver}-x86_64.deb::https://github.com/edneyosf/Edconv/releases/download/${pkgver}/Edconv-${pkgver}-x86_64.deb")
source_aarch64=("Edconv-${pkgver}-arm64.deb::https://github.com/edneyosf/Edconv/releases/download/${pkgver}/Edconv-${pkgver}-arm64.deb")

noextract=("Edconv-${pkgver}-x86_64.deb"
           "Edconv-${pkgver}-arm64.deb")

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('dc8adc0b9149a69d02fd62cc51dabb9fee23e38e7b7fc863bd741f7cab01d70a')
sha256sums_aarch64=('7d304957ad4970ede4058d0e31d7a560dec92887094170d2600e8959f4a2ca09')

# ci/cd flag: gh repo for auto updates
_ghrepo="edneyosf/Edconv"

package() {
  cd "$srcdir"

  local _deb
  case "$CARCH" in
    x86_64)  _deb="Edconv-${pkgver}-x86_64.deb" ;;
    aarch64) _deb="Edconv-${pkgver}-arm64.deb"  ;;
  esac

  bsdtar -xf "$_deb"
  bsdtar -xf data.tar.* -C "$pkgdir"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/Edconv/bin/Edconv "$pkgdir/usr/bin/edconv"

  install -Dm644 "$srcdir/LICENSE-${pkgver}" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
