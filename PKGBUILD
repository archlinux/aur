# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=orbitiny-desktop-bin
pkgver=0.1p1
pkgrel=2
_bincommit="7071a9111e52e00326c2c39ed143fa8bcea3a0a8"
_binhash="aab0c03c72fd1d9cf8d7aab73867574d"
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
source=("${pkgname%-bin}-$pkgver.tar.gz::$url/raw/commit/$_bincommit/orbitiny-bin-release/orbitiny-release.tar.gz")
noextract=("${pkgname%-bin}-$pkgver.tar.gz")
sha512sums=('c797fba5bfd06d831631cd5edfdfcf4db04e54516c3a302a8efb770fc02296015e5b7aa1cc53080e3100e5fed400c9ec097a856d13be0d712c844e6fd3c7f45d')
b2sums=('778c62d30b408a77ca678b218f7833eab1ada4977ead84dc45e7c985105247bc4b2dae9d4995b6aee2bdba94e83361fd839f01fb9b54dbeec70ccaf6fbfda7d2')

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
