# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: brainblasted <brainblasted at disroot dot org>

pkgname=libhandy
pkgver=0.0.2
pkgrel=1
pkgdesc="A library full of GTK+ widgets for mobile phones"
url="https://source.puri.sm/Librem5/libhandy"
license=(LGPL2.1)
arch=(x86_64)
depends=(gtk3)
makedepends=(git
             pkg-config
             meson)
conflicts=(${pkgname}-git)
source=("git+https://source.puri.sm/Librem5/${pkgname}.git#tag=v${pkgver}")
sha256sums=(SKIP)

build() {
    rm -rf build
    arch-meson "${pkgname}" build -Dexamples=false -Dgtk_doc=true
    ninja -C build
    ninja -C build libhandy-doc
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
