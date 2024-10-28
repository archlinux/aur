
# Maintainer: Matthias Eberlein
pkgname=youtube-to-mp3
pkgver=3.9.9.96
pkgrel=4
epoch=
pkgdesc="Downloads audio from YouTube or Vimeo and saves it to mp3 or m4a format to listen to locally"
arch=(x86_64 i686)
url="https://www.mediahuman.com/download.html"
license=(LicenseRef-custom)
depends=(
	'hicolor-icon-theme>=0.17-1'
	'qt5-multimedia>=5.14.1-1'
	'qt5-webengine'
	'qt5-declarative'
	'taglib1>=1.13.1-2'
)
provide=('youtube-to-mp3')
conflicts=('youtube-to-mp3')
source_i686=("${pkgname}-$(date +%F-%H).i386.deb::https://www.mediahuman.com/de/download/YouTubeToMP3.i386.deb")
source_x86_64=("${pkgname}-$(date +%F-%H).amd64.deb::https://www.mediahuman.com/de/download/YouTubeToMP3.amd64.deb")
md5sums_i686=("SKIP")
md5sums_x86_64=("SKIP")

pkgver() {
	bsdtar -xf control.tar.xz -C .
  actpkgverlong="$(cat 'control' | grep 'Version: ')"
  actpkgver=${actpkgverlong##*: }
  echo "$actpkgver"
}

package() {
	bsdtar -xf data.tar.xz -C ${pkgdir}/
  install -D "${pkgdir}/usr/share/doc/${pkgname}/copyright" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/youtube-to-mp3/YouTubeToMP3" "${pkgdir}/usr/bin/youtube-to-mp3"
}
