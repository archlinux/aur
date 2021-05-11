# Maintainer: taotieren <admin@taotieren.com>

_pkgname=SuperTabbar
pkgname=supertabbar-git
_softname=supertabbar
pkgver=dafb5af
pkgrel=1
pkgdesc="SuperTabbar 超级标签栏"
arch=('any')
url="https://gitee.com/Limexb/SuperTabbar"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname} 'supertabber')
#replaces=(${pkgname})
depends=('qt5-virtualkeyboard' 'qconf' 'qt5-tools' 'dtkwidget' 'libx11' 'dtkgui')
makedepends=('git' 'qt5-virtualkeyboard' 'qconf' 'qt5-tools' 'dtkwidget' 'libx11' 'dtkgui')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --always | sed 's|-|.|g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    qmake && make
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/${_softname}" "${pkgdir}/usr/bin/${_softname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_softname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}/debian/top.yzzi.${_softname}.desktop" "${pkgdir}/usr/share/applications/top.yzzi.${_softname}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}/debian/top.yzzi.${_softname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/top.yzzi.${_softname}.svg"
}
