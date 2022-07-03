# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xviewer-git
_pkgbasename=xviewer
pkgver=3.2.7.r0.gbb4aa66
pkgrel=1
pkgdesc="A simple and easy to use image viewer. X-Apps Project (git version)."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('xapp' 'gtk3' 'cinnamon-desktop' 'libpeas' 'libexif' 'libjpeg-turbo'
         'exempi')
makedepends=('git' 'gobject-introspection' 'librsvg' 'meson' 'itstool'
             'gtk-doc')
optdepends=('xviewer-plugins-git: Extra plugins'
            'librsvg: for scaling svg images'
            'webp-pixbuf-loader: webp image support')
provides=(${_pkgbasename})
conflicts=(${_pkgbasename})
url='https://github.com/linuxmint/xviewer'

source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')


pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags --exclude 'master*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
