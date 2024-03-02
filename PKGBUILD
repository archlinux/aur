# Maintainer: pingplug <aur at pingplug dot me>

_pkgname=mayo
_tag="v0.8.0"
_commit="697226a2a7d80e70103316ca1bb3be6a86132547"

pkgname=mayo-git
pkgver=0.8.0.r36.gc502b77
pkgrel=1
pkgdesc="3D CAD viewer and converter based on Qt and OpenCascade (git version)"
arch=('any')
url="https://github.com/fougue/mayo"
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'opencascade')
makedepends=('cmake' 'unzip' 'patch')
source=("git+https://github.com/fougue/mayo.git#branch=develop"
	'mayo.desktop')
sha256sums=('SKIP'
            '09872560c396807d00a7a98dddefdeb734ccdc64e0a752e028194a59622c220b')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git tag -f ${_tag} ${_commit} > /dev/null
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "${srcdir}"
  mkdir -p build && cd build
  cmake ../${_pkgname}
  make
}

package() {
  cd "${srcdir}"
  install -Dm755 build/mayo "${pkgdir}"/usr/bin/mayo
  install -Dm644 "${_pkgname}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/mayo/LICENSE.txt
  install -Dm644 "${_pkgname}"/images/appicon_256.png "${pkgdir}"/usr/share/mayo/appicon.png
  install -Dm644 mayo.desktop "${pkgdir}"/usr/share/applications/mayo.desktop
}
