# Maintainer: taotieren <admin@taotieren.com>
# Contributor: zlsun <zlsun1995 at gmail dot com>
# Contributor: yetist <yetist@gmail.com>

pkgname=lunar-calendar
pkgver=3.0.1
pkgrel=2
pkgdesc="a gtk+ calendar widget for chinese lunar library."
arch=($CARCH)
url="https://github.com/yetist/lunar-calendar"
license=('LGPL-2.1-or-later')
depends=(
    glib2
    glibc
    gtk3
    pango
# AUR
    lunar-date
)
makedepends=(
    git
    gtk-doc
    ninja
    meson
    gobject-introspection
    vala
)
source=("$pkgname::git+${url}.git#tag=v$pkgver")
sha256sums=('d890e738edd81e1a27338f81bd455da245681d80d44d1ed8b31e60d032ad4cba')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    arch-meson ${pkgname} build \
        -Dintrospection=true \
        -Dvapi=true \
        -Ddocs=true
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
    install -vDm644 "${srcdir}/${pkgname}"/*.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm644 "${srcdir}/${pkgname}"/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
