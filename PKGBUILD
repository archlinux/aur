# Maintainer: Hunter Peavey < vrywjvgviuotxeioqipx at disroot dot org >

# General package information
pkgname=wtwitch
pkgver=1.5.0
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
sha512sums=("3b4200dfd0989051cfe0cc6d9b14c0e3d9b1390bb771c2e691f82b66ca51cb685415dc11c7018f832b2b9d1c7107720e7dc3aeb3dd38f935388e7886decddeb9" "51e8cf92a91ffc9523f860ec4710d1ac9b261c7da559fa35cb931832d42687e4133a5afd56d2dc8af6832cb20be8781806ecd785df6ffc57fb8ef80d68badbc9")

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
