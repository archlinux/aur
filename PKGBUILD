# Maintainer: Hunter Peavey < vrywjvgviuotxeioqipx at disroot dot org >

# General package information
pkgname=wtwitch
pkgver=1.1.0
pkgrel=1
pkgdesc="Terminal user interface for Twitch"
url="https://gitlab.com/krathalan/wtwitch"
license=("GPL3")
arch=("any")
changelog="CHANGELOG"

# Dependencies
depends=("jq" "streamlink" "wget")
makedepends=("scdoc")

# Download information
_packagesig="${url}/uploads/35f0f599b19b8dcf70a6b6765dfd63ea/wtwitch-1.1.0.tar.gz.sig"
source=("${url}/-/archive/${pkgver}/wtwitch-${pkgver}.tar.gz" "${_packagesig}")
validpgpkeys=("0CE6D5B52BD80B4EDB8DF343546BFAE445159FFC")
sha256sums=("cc1bbb92b82a85b1ac87c8c49e852195a522fad41dc9e7c3011752c761369e40" "84dbfbcf6d85bdac3a5a3843201aaabbc96c16659369a4a5aca938717ef69b6b")

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

