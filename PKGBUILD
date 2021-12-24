#Maintainter: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=ttml2srt
pkgname=${_pkgname}-git
pkgver=r23.9dbda9d
pkgrel=1
pkgdesc="Timed Text Markup Language (TTML) to SubRib (SRT) converter "
arch=('any')
url="https://github.com/ivartj/ttml2srt.git"
license=('UNKNOWN')
makedepends=('git' 'cmake')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(git+https://github.com/ivartj/ttml2srt.git)
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/"${_pkgname}"
  mkdir -p build
  cd build
  cmake ..
  make all
}

package() {
	cd "${srcdir}"/"${_pkgname}"
	install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README" "${pkgdir}/usr/share/doc/${_pkgname}/README"
}
