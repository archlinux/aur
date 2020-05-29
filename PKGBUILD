# Maintainer: Hunter Peavey < vrywjvgviuotxeioqipx at disroot dot org >

# General package information
pkgname=wtwitch
pkgver=1.6.0
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
sha512sums=("8a8cf7d1dbe363dce846d6f0112c18fb9637bc8bd8daf13f0b739cf54ccf9811ef7866f84ae71c797bf7ec14072b752a45e9a954981c4ff0717b6c0c6e54d984" "57e2ff82056ccce63021b13119f4b2fceaea044a2048871c4b266af11bcc38057c72a6373c5d8da91ce8b44e62926b7a91857d0a83dd86fc74502246686cc566")

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
