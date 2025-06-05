# Maintainer: gogoprog <gogoprog at gmail dot com>

pkgname=gxinput-git
pkgver=r5.5dc5117
pkgrel=1
pkgdesc="Graphical front-end for xinput using wxwidgets"
arch=('x86_64')
url="https://github.com/gogoprog/gxinput"
license=("MIT")
depends=(wxwidgets)
makedepends=('git' 'haxe' 'wxwidgets-common')
optdepends=()
provides=('gxinput')
conflicts=('gxinput')
_pkgname=gxinput
source=("${_pkgname}::git+https://github.com/gogoprog/gxinput")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${_pkgname}"
    haxelib setup
    haxelib install hxcpp
    haxelib install haxeui-core
    haxelib install haxeui-hxwidgets
}

build() {
    cd "$srcdir/${_pkgname}"
    haxelib install hxcpp
    haxelib install haxeui-core
    haxelib install haxeui-hxwidgets
    make
}

package() {
    cd "$srcdir/${_pkgname}"
    make DESTDIR=${pkgdir} install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
