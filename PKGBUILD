# Maintainer: Liliane Fontenot <projects@liliane.io>
# Contributor: euler23 <jordanpaldino@gmail.com>

pkgname=libipuz
pkgver=0.5.2
pkgrel=1
pkgdesc='Library for parsing .ipuz puzzle files'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/libipuz'
license=('LGPL-2.1-or-later OR MIT')
depends=(json-glib)
makedepends=(glib2-devel gi-docgen gobject-introspection meson rust)
source=("${url}/-/archive/${pkgver}/libipuz-${pkgver}.tar.gz")
sha256sums=('eb51c2e8bb161ead535f65e92a815a46c8b64f0b46b67f42ad90186cdb894491')

build() {
    arch-meson "${pkgname}-${pkgver}" build --buildtype=release
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "${pkgdir}"
    cd "$pkgname-$pkgver"
    install -Dm644 COPYING.MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
