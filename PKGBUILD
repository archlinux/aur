# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=orbitiny-desktop-bin
pkgver=0.1p1
pkgrel=3
_bincommit="762ba31b92e9b68ce6d20c1043896f71a6e90f8a"
_binhash="2191f734a4e7eeb7f63c612644b1a47a"
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
sha512sums=('fb548015bf5880010eadcc92ef8ac0dc7764ed4539b8f76a6694532a5939c93a259272b9ea640052aff9716f12e3fe3a05ba15dd896a81a65a39fc00ab8a7e43')
b2sums=('cda32354f8fc91804770695a39732b54f9f25ca62b9c39066905797654956f22672ae9eebd872993ef01d8127c032ea9e3a0c4194ab360ab528b413481239368')

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
