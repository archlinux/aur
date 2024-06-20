# Maintainer: Alexander Rosenberg <zanderpkg at pm dot me>

_pkgname=coreboot-configurator
pkgname=$_pkgname-git
pkgver=11.0.gb27400d
pkgrel=1
pkgdesc="A simple GUI to change settings in coreboot's CBFS, via the nvramtool utility"
url='https://github.com/StarLabsLtd/coreboot-configurator'
arch=('x86_64')
provides=("$_pkgname")
license=('GPL2')
makedepends=('ninja' 'meson' 'git' 'inkscape')
depends=('nvramtool' 'yaml-cpp' 'qt5-base' 'qt5-svg')
source=('git+https://github.com/StarLabsLtd/coreboot-configurator.git')
sha256sums=('SKIP')

pkgver(){
  cd "$_pkgname"
  git describe --tags --long | sed 's#-#.#g'
}

build() {
    cd "$_pkgname"

    meson setup build/
    ninja -C build all
}

package() {
    cd "$_pkgname"

    export DESTDIR="$pkgdir"
    ninja -C build install
}
