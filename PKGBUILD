# Maintainer: Will Reed <wreed@disroot.org>

pkgname=confidant
pkgver=0.4.1
pkgrel=1
pkgdesc="Dotfile management tool designed to be simple (but powerful), fast and easy to use"
arch=('x86_64')
url="https://wreedb.github.io/confidant"
license=('GPL-3.0-or-later')
source=("https://codeberg.org/wreedb/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.source.tar.gz")
b2sums=('957431956b61c83775e3bf4b41687ab1c28c95413c34d1d6772fefad08ef04d685dcf2af078c89831d0dbb95d84b1d9b42fadd03d7e3d753940d4a7cca31e558')
depends=(libucl gcc-libs glibc)
makedepends=(meson scdoc)

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
