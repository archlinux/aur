# Maintainer: Hunter Peavey < printf "dev@die.bots" | sed "s/die.bots/krathalan.net/g" >

# General package information
pkgname=wtwitch
pkgver=2.2.1
pkgrel=2
pkgdesc="Terminal user interface for Twitch"
url="https://github.com/krathalan/wtwitch"
license=("GPL3")
arch=("any")
changelog="CHANGELOG"

# Dependencies
depends=("curl" "jq" "streamlink")
makedepends=("scdoc")
optdepends=('mpv: for watching streams'
            'vlc: for watching streams')

# Download information
source=("${url}/archive/refs/tags/${pkgver}.tar.gz" "${url}/releases/download/${pkgver}/${pkgver}.tar.gz.asc")
validpgpkeys=("B46B326273E4A1D21AAA3F6F529AC10050BD24EF")
sha256sums=("aefaec7fc251355a60cc2a8272ada6e59000e5ea70bb5cabf287552b60dc625e" "129b1e796f28f5c5c4c8c52bb79e8fb982f35ccf2db49dc014c1beab208e604d")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  # Create man page
  scdoc < wtwitch.1.scd > wtwitch.1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  # wtwitch "binary"
  install -D -m755 wtwitch "${pkgdir}/usr/bin/${pkgname}"

  # Bash completion file
  install -D -m644 wtwitch-completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"

  # man page
  install -D -m644 wtwitch.1 "${pkgdir}/usr/share/man/man1/wtwitch.1"
}
