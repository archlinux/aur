# Maintainer: Will Reed <wreed@disroot.org>

pkgname=confidant
pkgver=0.4.3
pkgrel=1
pkgdesc="Dotfile management tool designed to be simple (but powerful), fast and easy to use"
arch=('x86_64')
url="https://wreedb.github.io/confidant"
license=('GPL-3.0-or-later')
source=("https://codeberg.org/wreedb/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.source.tar.gz")
b2sums=('3597825edfde42fee38c86650521568ee01872371d3bd53cf25f58e630aec7fdd75de33f0302450de61ae7e841b91948cec3b3b2de2a08e484cbeb37b7ca0a33')
depends=(libucl gcc-libs glibc)
makedepends=(meson scdoc gettext)

_srcdir="${pkgname}-${pkgver}"

prepare() {
    meson subprojects download lyra --sourcedir ${_srcdir}
    arch-meson ${_srcdir} ${_srcdir}/build -D build-tests=true
}

build() {
    meson compile -C ${_srcdir}/build
}

check() {
    meson test -C ${_srcdir}/build
}

package() {
    meson install -C ${_srcdir}/build --destdir ${pkgdir}
    install -m 0644 ${_srcdir}/LICENSE.md -Dt ${pkgdir}/usr/share/licenses/${pkgname}
}