# Maintainer: Hunter Peavey < printf "srht@die.bots" | sed "s/die.bots/krathalan.net/g" >

# General package information
pkgname=wtwitch
pkgver=2.1.0
pkgrel=1
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
sha512sums=("3e21de68c80633c87c1680880a8b7c7ff3278cd605a03a343e1b4cac093288770332e4b7d14da532223322afc55d8602a4d955475df3c70f873f3801e56a244e" "7539c6053c1f43fe6c50a3683d79d4a02fa68dcc1288ea00d16d2fa7ad90c422f45d71fe98fca57c7bb63f4933efb21f5ae80225c3ec1548128357c1ffdd732d")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Create man page
  scdoc < wtwitch.1.scd > wtwitch.1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # wtwitch "binary"
  install -D -m755 wtwitch "${pkgdir}/usr/bin/${pkgname}"

  # Bash completion file
  install -D -m644 wtwitch-completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"

  # man page
  install -D -m644 wtwitch.1 "${pkgdir}/usr/share/man/man1/wtwitch.1"
}
