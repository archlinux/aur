# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

pkgname=aegisub-subinspector-git
_reponame=SubInspector
pkgver=v0.5.2.r11.c1154a0
pkgrel=1
pkgdesc="Subinspector library for the Aegisub Automation interface"
arch=('i686' 'x86_64')
url="https://github.com/TypesettingTools/${_reponame}"
license=('MIT')
depends=('aegisub' 'libass')
makedepends=('git' 'meson')

source=("${_reponame}::git+https://github.com/TypesettingTools/${_reponame}.git")
sha256sums=('SKIP')


pkgver() {
    cd "${_reponame}"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "${_reponame}"
    meson build
    ninja -C build
}

package() {
    local prefix="/usr/share/aegisub/automation"

    cd "${_reponame}"
    install -D -m644 examples/Aegisub/Inspector.moon "${pkgdir}${prefix}/include/SubInspector/Inspector.moon"
    install -D -m644 build/src/libSubInspector.so    "${pkgdir}${prefix}/include/SubInspector/Inspector/libSubInspector.so"

    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
