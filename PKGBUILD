# Maintainer: Ian Mcxa <ianmcxa@tutanota.com>

pkgname=budgie-brightness-applet-git
pkgver=0.1.2bfee64
pkgrel=1
pkgdesc="Screen brightness applet for Budgie Desktop"
arch=('i686' 'x86_64')
url='https://github.com/ilgarmehmetali/budgie-brightness-control-applet'
license=('GPL2')
sha256sums=('SKIP')
depends=('libpeas' 'budgie-desktop' 'gnome-settings-daemon') 
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')
source=("${pkgname}::git+${url}")

prepare() {
    cd "$srcdir/${pkgname}"
    git checkout popover
}

build() {
    cd "$srcdir/${pkgname}"
    mkdir -p build
    cd "${srcdir}/${pkgname}/build"
    meson --prefix /usr --buildtype=plain ..
    ninja
}

package() {
    cd "${srcdir}/${pkgname}/build"
    DESTDIR="${pkgdir}" ninja install
}

