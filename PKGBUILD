# Maintainer: nissen22
_pkgname=dlb_mp4base
pkgname=${_pkgname}-git
pkgver=r24.6bd15a5
pkgrel=1
pkgdesc="The Dolby MP4 streaming muxer (for Dolby Vision)."
arch=("x86_64" "x86")
url="https://github.com/DolbyLaboratories/dlb_mp4base"
license=("BSD-3")

depends=()
makedepends=("git")
conflicts=()
optdepends=()

source=("${_pkgname}::git+https://github.com/DolbyLaboratories/${_pkgname}.git")
sha512sums=('SKIP')


pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${_pkgname}/make/mp4muxer/linux_amd64
    make mp4muxer_release
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/make/mp4muxer/linux_amd64/mp4muxer_release" "${pkgdir}/usr/bin/mp4muxer"
}
