# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=orbitiny-desktop-bin
pkgver=0.1p1
pkgrel=4
_bincommit="851b5f24480f4aa16084c85de6ee01238f341f1d"
_binhash="5bdf85ba7ab55e07d557df00588baa0e"
pkgdesc="A new, 100% portable, innovative and traditional but modern looking desktop environment for Linux"
arch=(x86_64)
url="https://codeberg.org/sasko-usinov/${pkgname%-bin}"
license=(GPL-3.0-only)
depends=(
  acl
  bash
  dbus
  file
  gcc-libs
  glib2
  glibc
  krb5
  libcap
  zlib
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
source=("${pkgname%-bin}-$pkgver.tar.gz::$url/raw/commit/$_bincommit/${pkgname//-desktop/}-release/${pkgname%-desktop-bin}-release.tar.gz")
noextract=("${pkgname%-bin}-$pkgver.tar.gz")
sha512sums=('6f08e6fa962ad242332310c9e7479386e69b6b7fc25775f43ee8473a7c77d322e2870c6fc288b6bbf0577a773f885524a31226547d6caf9cf0b631e3e0d8231c')
b2sums=('9eff230772df950c610c68402d0bb3c0fd3def63e4e4fd8eefc26456a471daa0c12bdb315a8d8a3f4b2baa936a24e56334547a05ff792f0e991b0f0ade755783')

prepare() {
  md5sum -c <<< "$_binhash ${pkgname%-bin}-$pkgver.tar.gz"
}

package() {
  install -vd "$pkgdir"/opt/${pkgname%-bin}
  tar -xzf ${pkgname%-bin}-$pkgver.tar.gz \
    --no-same-owner \
    --strip-components=1 \
    --exclude=".config" \
    --exclude=".portable_mode" \
    -C "$pkgdir"/opt/${pkgname%-bin}
}
