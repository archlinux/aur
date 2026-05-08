# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=edconv-bin
pkgver=1.5.3
pkgrel=1
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
sha256sums_x86_64=('32b19a8072d70561982f1b3961da77b2ffed98b3218f9faeb22d771d3057336b')
sha256sums_aarch64=('96c31cfdb2caa7bf7e391f761da9fe47556a49654cf13817f0efce620d86a587')

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
