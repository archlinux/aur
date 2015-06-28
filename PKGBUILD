# Maintainer: Maik Broemme <mbroemme@libmpq.org>
# Donate BTCS: 13xcw57QyS8h6GuxtbatAH9S6igwytd7Uo
pkgname="bitcoin-scrypt-git-qt"
pkgdesc="Bitcoin Scrypt is a decentralised currency and using the Scrypt algorithm - Qt"
pkgver=20140107.2ba1ffc
pkgrel=1
arch=("i686" "x86_64")
url="http://bitcoinscrypt.org/"
license=("MIT")
depends=("boost-libs" "qt4" "miniupnpc" "qrencode")
makedepends=("boost" "automoc4" "qrencode" "miniupnpc")
provides=("bitcoin-scrypt-qt")
source=(
  "bitcoin-scrypt::git://github.com/Omega6/Bitcoin-Scrypt.git"
)
sha256sums=(
  "SKIP"
)

pkgver() {
  cd "${srcdir}/bitcoin-scrypt"
  git log -1 --date=short --format="%cd.%h" | tr -d '-'
}

build() {
  cd "${srcdir}/bitcoin-scrypt"
  qmake-qt4 USE_QRCODE=1 USE_DBUS=1 USE_UPNP=1 Bitcoin-sCrypt.pro
  make
}

package() {
  cd "${srcdir}/bitcoin-scrypt"
  install -D -m 0755 Bitcoin-sCrypt "${pkgdir}/usr/bin/Bitcoin-sCrypt"
  install -D -m 0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
