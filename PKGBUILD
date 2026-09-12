pkgname=skwd-deck-steamworks-bin
pkgver=1.0.0_beta.13
pkgrel=1
pkgdesc='Prebuilt optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
options=(!debug !strip)
depends=(gcc-libs glibc skwd-deck)
optdepends=('steam: running Steam client used by the backend')
provides=("skwd-deck-steamworks=$pkgver")
conflicts=(skwd-deck-steamworks)
source_x86_64=(
  'skwd-deck-steamworks-1.0.0_beta.13-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.13/skwd-deck-steamworks-1.0.0_beta.13-1-x86_64.pkg.tar.zst'
)
noextract=('skwd-deck-steamworks-1.0.0_beta.13-1-x86_64.pkg.tar.zst')
sha256sums_x86_64=('f7dfb764096dd45446c8e70e92787e53f68e5f11cc0b9aff57236dc56d8cb2a3')

prepare() {
  mkdir -p "$srcdir/steamworks"
  bsdtar -xf "$srcdir/skwd-deck-steamworks-1.0.0_beta.13-1-x86_64.pkg.tar.zst" -C "$srcdir/steamworks" \
    --exclude .BUILDINFO --exclude .MTREE --exclude .PKGINFO
}

package() {
  mkdir -p "$pkgdir/usr"
  cp -a --no-preserve=ownership "$srcdir/steamworks/usr/." "$pkgdir/usr/"
}
