# Maintainer: Zhou Qiankang <wszqkzqk@qq.com>

pkgname=pdf-svg-conv
pkgver=0.1.3
pkgrel=2
pkgdesc="A powerful PDF/SVG format conversion tool that supports multi-threaded PDF to SVG conversion (including encrypted PDFs), as well as SVG to PDF conversion"
url="https://github.com/wszqkzqk/${pkgname}"
arch=('x86_64' 'aarch64' 'riscv64' 'loong64')
license=(LGPL-2.1-or-later)
depends=(
    cairo
    glib2
    librsvg
    poppler-glib
)
makedepends=(
    git
    help2man
    meson
    vala
)

source=("git+https://github.com/wszqkzqk/${pkgname}.git#tag=${pkgver}")
sha256sums=('306ea1f37444b00b1fc4c1e018df5d9da0c42eb03ae5ee86c9c7c68ab60ef683')

build() {
    arch-meson "${pkgname}" build
    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
    install -Dm644 "${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
