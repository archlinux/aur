# Maintainer: gbr <gbr@protonmail.com>
pkgname=gnethogs
pkgver=0.2
pkgrel=2
pkgdesc='GTK front-end for nethogs'
arch=('x86_64')
url='https://github.com/mbfoss/gnethogs'
license=('GPL')
depends=(
    'nethogs'
    'gtkmm3'
)
makedepends=(
    'intltool'
    'libxml2'
)
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/mbfoss/gnethogs/archive/v${pkgver}.tar.gz"
        "nethogsmonitor_init.patch"
)
sha1sums=('1a9f2eace9536745191836ad063cbd4bce12d117'
          'SKIP'
)
install=gnethogs.install

prepare() {
    cd "${pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/nethogsmonitor_init.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
