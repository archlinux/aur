# Maintainer: redtide <redtid3@gmail.com>
 
_pkgname="jknobman"
pkgname="${_pkgname}-git"
pkgver=r12.5f56301
pkgrel=1
pkgdesc="VSTGUI - AnimationKnob Design tool"
url="https://www.g200kg.com/jp/software/knobman.html"
arch=('any')
license=('custom')
makedepends=("git" "maven")
depends=('java-runtime')
source=("${_pkgname}"::"git+https://github.com/g200kg/KnobMan")
sha256sums=('SKIP')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${_pkgname}"
    export MAVEN_OPTS=-Dmaven.repo.local="$srcdir/repository"
    make
}
package() {
    cd "${srcdir}/${_pkgname}"
    export MAVEN_OPTS=-Dmaven.repo.local="$srcdir/repository"
    DESTDIR="${pkgdir}/" PREFIX=/usr make install
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}