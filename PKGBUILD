# Maintainer: Hunter Peavey < printf "dev@die.bots" | sed "s/die.bots/krathalan.net/g" >

# General package information
pkgname=wtwitch
pkgver=2.3.2
pkgrel=1
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
source=("${url}/archive/refs/tags/${pkgver}.tar.gz" "${url}/releases/download/${pkgver}/${pkgver}.tar.gz.sig")
validpgpkeys=("0C6B73F391FA26F0EBCD1F75C0F9AEE56E47D174")
sha256sums=("b53751886feee3174c2fdba20c67d408f939d0f0c4a5e2f1c6a889cc92a82bf0" "44a13fcb6c3d3d96167d20b218344a26bd59f98d2450b1f77345150cdc8a01ff")

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
