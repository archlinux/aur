# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
pkgname=cubegui-plugin-blade
pkgver=0.5
pkgrel=1
pkgdesc="A plugin for Cube to visualize OTF2 trace"
arch=("x86_64")
url="http://www.scalasca.org/"
license=('BSD')
depends=("cubegui>=4.8", "otf2>=3.0")
provides=("cubegui-plugin-blade")
source=("https://perftools.pages.jsc.fz-juelich.de/addons/cube/plugins/blade/blade-v${pkgver}.tar.gz")
md5sums=("396ea50030ddfa6e95c29944a99a917b")

prepare() {
    cd "${srcdir}/bladeplugin-${pkgver}"
    ./configure \
        --prefix=/usr \
        --with-otf2-library \
        --with-cube-library
}

build() {
    cd "${srcdir}/bladeplugin-${pkgver}"
    make
}

check() {
    cd "${srcdir}/bladeplugin-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/bladeplugin-${pkgver}"

    make DESTDIR="${pkgdir}/" install

    install -D -m644 \
        "${srcdir}/bladeplugin-${pkgver}/COPYING" \
        "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

