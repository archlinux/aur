# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xviewer-plugins-git
_pkgbasename=xviewer-plugins
pkgver=3.4.1.r1.g3c04c17
pkgrel=1
pkgdesc="Plugins for xviewer. X-Apps Project (git version)."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL-2.0-or-later')
depends=(
    'xviewer'
    'libpeas'
)
makedepends=(
    'git'
    'gnome-common'
    'gobject-introspection'
    'meson'
    'libchamplain'
)
optdepends=(
    'libchamplain: Map plugin'
)
provides=($pkgname $_pkgbasename)
conflicts=("${_pkgbasename}")
url='https://github.com/linuxmint/xviewer-plugins'

source=("${pkgname}::git+https://github.com/linuxmint/${_pkgbasename}.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags --exclude 'master*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd ${srcdir}/${pkgname}

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
