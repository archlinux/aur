# Maintainer: Hunter Peavey < vrywjvgviuotxeioqipx at disroot dot org >

# General package information
pkgname=wtwitch
pkgver=1.4.2
pkgrel=1
pkgdesc="Terminal user interface for Twitch"
url="https://git.sr.ht/~krathalan/wtwitch"
license=("GPL3")
arch=("any")
changelog="CHANGELOG"

# Dependencies
depends=("jq" "streamlink" "wget")
makedepends=("scdoc")
optdepends=('mpv: for watching streams'
            'vlc: for watching streams')

# Download information
_packagesig="${url}/blob/master/signatures/${pkgver}.tar.gz.sig"
source=("${url}/archive/${pkgver}.tar.gz" "${_packagesig}")
validpgpkeys=("02AAA23ABDF1D538BD889D251AADE5E728FFC667")
sha512sums=("287250207bc705e99a18a6eeb97bdfa72c67e6847b4640fa7847424031e77416515afcafaf13c04c7212bf0b29d1efb5812b2e5d6c68b5a1aa772eb21431fbb2" "ec6911f59a0b412db323d0433b1176479a17caf684af2423a037d4e0f6683079545ad6e504fa66eee215ee2dd21a61c762e23f184ba0cad5158fd634a2f8ee1a")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Create man page
  scdoc < wtwitch.1.scd > wtwitch.1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # wtwitch "binary"
  install -D -m755 wtwitch "${pkgdir}/usr/bin/${pkgname}"

  # man page
  install -D -m644 wtwitch.1 "${pkgdir}/usr/share/man/man1/wtwitch.1"
}
