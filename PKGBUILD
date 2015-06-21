# Maintainer: Ricardo Funke <ricardo [at] gmail [dot] com>

pkgname=subtitle-master
pkgver=2.0.0
_pkgver=${pkgver}-beta1
pkgrel=2
pkgdesc="Easily find and download subtitles for your videos."
arch=('x86_64' 'i686')
url="http://subtitlemaster.com/"
license=('custom')
depends=('ttf-liberation' 'gconf' 'nss')
provides=('subtitle-master')
conflicts=('subtitle-master')
options=('!strip')
sha1sums=('af87faf0c0c59be3d3efc3a24f13bd0f80a6f418'
          'a07f3ec238c3f68e8e26593e27069f2f31fbe309'
          'd3c692aa68d8ba5b9a0848822f4225c3b2a0ae35')

_platform=linux64

if [ "$CARCH" = 'i686' ]; then
  _platform=linux32
  sha1sums[0]='23d419b5b0e74bb31cdf15e1624074ea94372f40'
fi

source=("https://github.com/subtitle-master/subtitlemaster/releases/download/${_pkgver}/${pkgname}-${_pkgver}-${_platform}.zip"
        "subtitle-master.png"
        "subtitle-master.desktop")

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/opt/${pkgname}/"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share"

  # Program
  echo "${pkgdir}/opt/${pkgname}/"
  install -Dm755 "${srcdir}/Subtitle Master/Subtitle Master"	"${pkgdir}/opt/${pkgname}/subtitlemaster"
  install -Dm644 "${srcdir}/Subtitle Master/nw.pak"		"${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/Subtitle Master/libffmpegsumo.so"	"${pkgdir}/opt/${pkgname}/"

  # Link to program
  ln -s "/opt/${pkgname}/subtitlemaster" "${pkgdir}/usr/bin/subtitlemaster"

  # Desktop file
  install -Dm644 "${srcdir}/subtitle-master.desktop" "${pkgdir}/usr/share/applications/subtitle-master.desktop"

  # Icon
  install -Dm644 "${srcdir}/subtitle-master.png" "${pkgdir}/usr/share/pixmaps/subtitle-master.png"
}
