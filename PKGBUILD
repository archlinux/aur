# Maintainer: Hunter Peavey < printf "srht@die.bots" | sed "s/die.bots/krathalan.net/g" >

# General package information
pkgname=wtwitch
pkgver=2.0.0
pkgrel=2
pkgdesc="Terminal user interface for Twitch"
url="https://git.sr.ht/~krathalan/wtwitch"
license=("GPL3")
arch=("any")
changelog="CHANGELOG"

# Dependencies
depends=("curl" "jq" "streamlink")
makedepends=("scdoc")
optdepends=('mpv: for watching streams'
            'vlc: for watching streams')

# Download information
_packagesig="${url}/blob/master/signatures/${pkgver}.tar.gz.sig"
source=("${url}/archive/${pkgver}.tar.gz" "${_packagesig}")
validpgpkeys=("B46B326273E4A1D21AAA3F6F529AC10050BD24EF")
sha512sums=("a708989b68128cb16cf0dde1fd613903a42da6aae975b4b016c6be0f9f10d8309b80a6f84983ca398339fd9f11e966c4236788bf93d35f9c436c8c0ea99e8a1a" "04f357fcb4d9208643a7f8329b35bd8035a72f1e9b4ddabd686c9823a03e74d7d958a1f2fce5fef50321a4000f1f84a349d2f369bac296c6ab98ce6b0c35bbae")

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
