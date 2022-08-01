# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xviewer
pkgver=3.2.10
pkgrel=1
pkgdesc="A simple and easy to use image viewer. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('xapp' 'gtk3' 'cinnamon-desktop' 'libpeas' 'libexif' 'libjpeg-turbo'
         'exempi')
makedepends=('gobject-introspection' 'librsvg' 'meson' 'itstool'
             'gtk-doc')
optdepends=('xviewer-plugins: Extra plugins'
            'librsvg: for scaling svg images'
            'webp-pixbuf-loader: webp image support')
url='https://github.com/linuxmint/xviewer'

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('0b0b8cf7b84d6e0d139066d2e136a6b2')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    mkdir -p "${srcdir}"/${pkgname}-${pkgver}/build
    cd "${srcdir}"/${pkgname}-${pkgver}/build

    meson --prefix=/usr \
          --libexecdir=lib/${pkgname} \
          --buildtype=plain \
          ..
    ninja
}

package(){
    cd "${srcdir}"/${pkgname}-${pkgver}/build

    DESTDIR="$pkgdir/" ninja install
}
