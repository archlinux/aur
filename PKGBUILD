# Maintainer: Jorge Araya Navarro <jorge@esavara.cr>
pkgname=hide-git
_pkgname=hide
pkgver=0.1.0.8d351e3
pkgrel=3
pkgdesc="an extensible editor for Heaps game engine"
arch=('i686' 'x86_64')
url="https://github.com/HeapsIO/hide"
license=('BSD')
depends=('nwjs')
makedepends=('haxe' 'git')
provides=('hide')
conflicts=('hide')
source=(
  "${pkgname}::git+https://github.com/HeapsIO/${_pkgname}.git"
  "icon.svg"
  "io.heaps.hide.desktop"
  "hide"
)
sha256sums=('SKIP'
            '1255733ff1ad84f207a3850082f000d40023df5ec1415a3fa49ec3c6fcb50f12'
            '77965d8ea53498683700f448a0f9fed0aa08093ad8d09167682f29ab0e944e73'
            '3a275819cef41f15e9e54b8793985ee979d2c6973fa65193de05cb9e9970e957')

pkgver() {
  cd "$srcdir/${pkgname}"
  echo "0.1.0.$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname}"

  haxelib setup "${srcdir}/${pkgname}/haxelib"
  
  haxelib git heaps https://github.com/HeapsIO/heaps
  haxelib git castle https://github.com/ncannasse/castle
  haxelib git hxbit https://github.com/ncannasse/hxbit
  haxelib git hscript https://github.com/HaxeFoundation/hscript
  haxelib git hxnodejs https://github.com/HaxeFoundation/hxnodejs
  haxelib git domkit https://github.com/HeapsIO/domkit
  haxelib git hx3compat https://github.com/HaxeFoundation/hx3compat
}

build() {
  cd "$srcdir/${pkgname}"

  haxelib setup "${srcdir}/${pkgname}/haxelib"
  haxe --verbose hide.hxml
}

package() {
  cd "$srcdir/${pkgname}"

  install -Ddm755 "${pkgdir}/usr/share/hide"
  cp -r ./bin/{libs,res,app.html,cdb.css,defaultProps.json,hide.js,package.json,package-cdb.json,style.css} "${pkgdir}/usr/share/hide/"

  install -Dm644 "${srcdir}"/icon.svg "${pkgdir}"/usr/share/pixmaps/hide.svg
  install -Dm645 "${srcdir}"/hide "${pkgdir}"/usr/bin/hide
  install -Dm644 "${srcdir}"/io.heaps.hide.desktop "${pkgdir}"/usr/share/applications/hide.desktop
}

# vim:set ts=2 sw=2 et:
