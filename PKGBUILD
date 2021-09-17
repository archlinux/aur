# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=album_splitter
pkgname=${_pkgname}-git
pkgver=r19.d883a0d
pkgrel=1
pkgdesc="Simple awk/bash script to split a (single-video) album from YouTube into separate tracks, based on the tracks listed in its description."
arch=('any')
url="https://github.com/Pab0/${_pkgname}.git"
license=('GPL-3.0')
depends=('youtube-dl' 'ffmpeg')
makedepends=('git')
provides=(${_pkgname})
source=(
  "git+${url}"
  "album_splitter.sh"
)

sha512sums=(
  'SKIP'
  '9b2f50265ae2b4f567ad9537f2bd07cfee16b6264e5b948f5d252d4441fba36c1c219dce6e43da819c6cf853d5fef25c8c7a72fc7a457b7128ab8f474ca4b953'
)

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"/"${_pkgname}"
	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 "album_splitter.sh" "${pkgdir}/opt/${_pkgname}/album_splitter.sh"
	install -Dm644 "format_titles.awk" "${pkgdir}/opt/${_pkgname}/format_titles.awk"
	install -Dm644 "split_audio.awk" "${pkgdir}/opt/${_pkgname}/split_audio.awk"
	install -Dm755 "${startdir}/album_splitter.sh" "${pkgdir}/usr/bin/album_splitter"
}
