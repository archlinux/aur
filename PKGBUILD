# Maintainer: Liliane Fontenot <projects@liliane.io>
# Contributor: euler23 <jordanpaldino@gmail.com>

pkgname=libipuz
pkgver=0.5.5
pkgrel=1
pkgdesc='Library for parsing .ipuz puzzle files'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/libipuz'
license=('LGPL-2.1-or-later OR MIT')
depends=(json-glib)
makedepends=(glib2-devel gi-docgen gobject-introspection meson rust)
source=("${url}/-/archive/${pkgver}/libipuz-${pkgver}.tar.gz")
sha256sums=('305a83e76b7c683b5cdd71f60d5c232c6f8fa3015cd4269b8b246d702c83ea85')

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
