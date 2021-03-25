# Maintainer  : Yamada Hayao <hayao@fascode.net>

_reponame="DeepinV20-dark-cursors"
_pkgname="$(echo "${_reponame}" | tr "[:upper:]" "[:lower:]")"
pkgname="${_pkgname}-git"
pkgdesc="DeepinV20 Dark Cursors for linux desktops"
arch=("any")
url="https://github.com/yeyushengfan258/${_reponame}"

depends=('libxcursor')
makedepends=("inkscape" "xorg-xcursorgen" )

pkgver=r2.b8a6de9
pkgrel=1

conflicts=("${_pkgname}")
provides=("${_pkgname}")

license=('GPL3')

source=("git+${url}.git")
md5sums=("SKIP")

pkgver() {
  cd "${_reponame}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
    cd "${srcdir}/${_reponame}"
    bash -xv "${srcdir}/${_reponame}/build.sh"
}

package() {
    mkdir -p "${pkgdir}/usr/share/icons/${_pkgname}"
    mv "${srcdir}/${_reponame}/dist/"* "${pkgdir}/usr/share/icons/${_pkgname}/"
}
