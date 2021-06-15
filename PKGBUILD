# Maintainer: taotieren <admin@taotieren.com>

_pkgname=SuperTabbar
pkgname=supertabbar-git
pkgver=6c8dc30
pkgrel=1
pkgdesc="SuperTabbar 超级标签栏"
arch=('any')
url="https://gitee.com/Limexb/SuperTabbar"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname} 'supertabber')
#replaces=(${pkgname})
depends=('dtkwidget' 'dtkgui')
makedepends=('git' 'qconf')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --always | sed 's|-|.|g'
#     git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    qmake ./${_pkgname}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
    make -C ./build
}

package() {
    install -Dm0755 "${srcdir}/${_pkgname}/build/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm0644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm0644 "${srcdir}/${_pkgname}/debian/top.yzzi.${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/top.yzzi.${pkgname%-git}.desktop"
    install -Dm0644 "${srcdir}/${_pkgname}/debian/top.yzzi.${pkgname%-git}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/top.yzzi.${pkgname%-git}.svg"
}
