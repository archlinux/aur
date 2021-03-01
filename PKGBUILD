# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xviewer-git
_pkgbasename=xviewer
pkgver=master.lmde4.r0.gb2849a6
pkgrel=1
pkgdesc="A simple and easy to use image viewer. X-Apps Project (git version)."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('xapp' 'gtk3' 'cinnamon-desktop' 'libpeas' 'libexif' 'libjpeg-turbo')
makedepends=('git' 'gnome-common' 'gobject-introspection' 'librsvg' 'exempi')
optdepends=('xviewer-plugins-git: Extra plugins'
            'exempi: XMP metadata support'
            'librsvg: for scaling svg images')
provides=(${_pkgbasename})
conflicts=(${_pkgbasename})
url='https://github.com/linuxmint/xviewer'

source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname}

    NOCONFIGURE=1 gnome-autogen.sh
    gnome-autogen.sh --prefix="/usr" \
        --localstatedir="/var" \
         --libexecdir="/usr/lib"
    make
}

package(){
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
}
