# Maintainer: astrolince <juan77.sonic [at] gmail [dot] com>

pkgname=popcorntime-community
pkgver=0.3.8.5
_pkgver='0.3.8-5'
pkgrel=7
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch."
arch=('x86_64' 'i686')
url="https://github.com/astrolince/popcorn-desktop"
license=('GPL3')
depends=('libnotify' 'desktop-file-utils' 'ttf-font' 'gconf' 'nss' 'libxtst' 'gtk2' 'alsa-lib')
optdepends=('net-tools: necessary for the new vpn feature' 'ttf-liberation: open source ttf fonts')
provides=('popcorntime' 'popcorntime-bin')
conflicts=('popcorntime' 'popcorntime-bin')
options=('!strip')
install="popcorntime.install"
sha1sums=('bdfc10021882f439e3118f60e77dd61b5b3b5cb4'
            'd2e56426a321faabd316ea0bc89b2fa2fb0dfa48'
            '98cba5c0c979d37e601cc33cf3b562f106427d36')

_platform='Linux-64'

if [ "$CARCH" = 'i686' ]; then
  _platform='Linux-32'
  sha1sums[0]='5af37b6eca40ce50cdf0b812cdf05a5f923865e0'
fi

#source=("http://get.popcorntime.io/build/Popcorn-Time-${_pkgver}-${_platform}.tar.xz"
#source=("http://web.archive.org/web/20150909191012/http://get.popcorntime.io/build/Popcorn-Time-${_pkgver}-${_platform}.tar.xz"
#source=("http://web.archive.org/web/20150909184516/http://128.199.107.206/build/Popcorn-Time-${_pkgver}-${_platform}.tar.xz"
source=("https://github.com/astrolince/popcorn-desktop/releases/download/v${_pkgver}/Popcorn-Time-Community-${_pkgver}-${_platform}.tar.xz"
        "popcorntime.install"
        "popcorntime.desktop")

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/opt/${pkgname}/"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share"

  # Program
  echo "${pkgdir}/opt/${pkgname}/"
  install -Dm755 "${srcdir}/Popcorn-Time"	"${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/nw.pak"		"${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/libffmpegsumo.so"	"${pkgdir}/opt/${pkgname}/"
#  install -Dm644 "${srcdir}/CHANGELOG.md"	"${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/icudtl.dat"		"${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/install"		"${pkgdir}/opt/${pkgname}/"
#  install -Dm644 "${srcdir}/LICENSE.txt"	"${pkgdir}/opt/${pkgname}/"
#  install -Dm644 "${srcdir}/package.json"	"${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/package.nw"		"${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/popcorntime.png"	"${pkgdir}/opt/${pkgname}/"
#  install -Dm644 "${srcdir}/README.md"		"${pkgdir}/opt/${pkgname}/"

  # Directories
  cp -a "${srcdir}/locales"			"${pkgdir}/opt/${pkgname}/"
#  cp -a "${srcdir}/node_modules"		"${pkgdir}/opt/${pkgname}/"
#  cp -a "${srcdir}/src"				"${pkgdir}/opt/${pkgname}/"

  # Link to program
  ln -s "/opt/${pkgname}/Popcorn-Time" "${pkgdir}/usr/bin/popcorntime"

  # Desktop file
  install -Dm644 "${srcdir}/popcorntime.desktop" "${pkgdir}/usr/share/applications/popcorntime.desktop"

  # Icon
  install -Dm644 "${srcdir}/popcorntime.png" "${pkgdir}/usr/share/pixmaps/popcorntime.png"
}

