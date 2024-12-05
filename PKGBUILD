# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xviewer
pkgver=3.4.7
pkgrel=1
pkgdesc="A simple and easy to use image viewer. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('xapp' 'gtk3' 'cinnamon-desktop' 'libpeas' 'libexif' 'libjpeg-turbo'
         'exempi')
makedepends=(
    'gobject-introspection' 'librsvg' 'meson' 'itstool'
    'gtk-doc'
    'glib2-devel'
)
optdepends=('xviewer-plugins: Extra plugins'
            'librsvg: for scaling svg images'
            'webp-pixbuf-loader: webp image support'
            'libheif: Load .heif, .heic, and .avif'
            'libavif: Load .avif'
            'yelp: View xviewer help and documentation from the app'
)
url='https://github.com/linuxmint/xviewer'

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('239544744c2168094ecca3dc33f554ed')
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
