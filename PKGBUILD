# Maintainer: Hunter Peavey < vrywjvgviuotxeioqipx at disroot dot org >

# General package information
pkgname=wtwitch
pkgver=1.0.0
pkgrel=2
pkgdesc="Terminal user interface for Twitch"
url="https://gitlab.com/krathalan/wtwitch"
license=("GPL3")
arch=("any")

# Dependencies
makedepends=("asciidoc")
depends=("bash" "jq" "streamlink" "wget")

# Download information
source=("${url}/uploads/93e5e3d5ff9087a501cacaf0ac006888/wtwitch-1.0.0-2.tar.gz" "${url}/uploads/479acc6c01759ac3bdd623036927cc73/wtwitch-1.0.0-2.tar.gz.sig")
validpgpkeys=("0CE6D5B52BD80B4EDB8DF343546BFAE445159FFC")
sha256sums=("89facb5179577ca8393d175309f15607ff4da0476d147127d4b666e5c87da0a9" "586a59b4bf0e211ecb87ab4f4623f4139dae17fb1fa8710f0638a2ddac197404")

prepare() {
  # Build manpage from asciidoc
  cd "${srcdir}"
  a2x --format manpage wtwitch.1.adoc
}

package() {
  cd "${srcdir}"

  # wtwitch binary
  install -D -m755 wtwitch "${pkgdir}/usr/bin/${pkgname}"

  # man page
  install -D -m644 wtwitch.1 "${pkgdir}/usr/share/man/man1/wtwitch.1"
}

