# Maintainer: Artem Senichev <artemsen@gmail.com>

pkgname=swayimg
pkgver=1.1
pkgrel=1
pkgdesc='Image viewer for Sway/Wayland'
arch=('x86_64')
license=('MIT')
makedepends=('meson' 'ninja' 'wayland-protocols')
depends=('wayland' 'cairo' 'json-c')
optdepends=('libjpeg: JPEG images support'
            'giflib: GIF images support'
            'librsvg-2.0: SVG images support'
            'libwebp: WebP images support')
url='https://github.com/artemsen/swayimg'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('f30c1b2a4991178daeb9aee886ee212e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    meson --prefix=/usr "${srcdir}/build"
    ninja -C "${srcdir}/build"
}

package(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
}
