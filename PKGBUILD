# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xviewer
pkgver=3.0.2
pkgrel=1
pkgdesc="A simple and easy to use image viewer. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('xapp' 'gtk3' 'cinnamon-desktop' 'libpeas' 'libexif' 'libjpeg-turbo'
         'exempi')
makedepends=('gnome-common' 'gobject-introspection' 'librsvg')
optdepends=('xviewer-plugins: Extra plugins'
            'exempi: XMP metadata support'
            'librsvg: for scaling svg images')
url='https://github.com/linuxmint/xviewer'

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('8c4ae09f8b5f3036ed04c0cdbe5d8f5b')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    NOCONFIGURE=1 gnome-autogen.sh
    gnome-autogen.sh --prefix="/usr" \
        --localstatedir="/var" \
         --libexecdir="/usr/lib"
    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}
