# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xed-git
_pkgbasename=xed
pkgver=master.mint20.r4.ga71e7ee
pkgrel=1
pkgdesc="A small and lightweight text editor. X-Apps Project (git version)."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('gtksourceview4' 'enchant' 'desktop-file-utils' 'libsm'
        'libpeas' 'xapps' 'gspell')
makedepends=('git' 'gobject-introspection' 'meson' 'intltool' 'itstool')
provides=($pkgname $_pkgbasename)
conflicts=(${_pkgbasename})
url="https://github.com/linuxmint/${_pkgbasename}"

source=("${pkgname}::git+https://github.com/linuxmint/${_pkgbasename}.git")
md5sums=('SKIP')

prepare() {
    cd ${srcdir}/${pkgname}
}

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -p "${srcdir}"/${pkgname}/build
    cd "${srcdir}"/${pkgname}/build

    meson --prefix=/usr \
          --libexecdir=lib/${pkgname} \
          --buildtype=plain \
          ..
    ninja
}

package(){
    cd "${srcdir}"/${pkgname}/build

    DESTDIR="$pkgdir/" ninja install
}

