# Maintainer: Hunter Peavey < vrywjvgviuotxeioqipx at disroot dot org >

# General package information
pkgname=wtwitch
pkgver=1.6.1
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
sha512sums=("c4994644376043d39e5be8b72dae3a8630f3c3c4f5d30b3b82f5ca15aa7b48b7e0ef77911f3b5bc1edac18860a66c81cde5c1515b4d2ae667f84ae7f208ecb9a" "9ea716cdff6ab02ea4c9b3619fae1d4cb32535de3d3100861b3f8ed071309ec16121f0aae3a59a5a366af0fdcb88df78079261ef1e73b42b830441fc330a8654")

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
