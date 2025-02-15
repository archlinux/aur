# Maintainer: Zhou Qiankang <wszqkzqk@qq.com>

pkgname=pdf-svg-conv
pkgver=0.1.2
pkgrel=1
pkgdesc="A powerful PDF/SVG format conversion tool that supports multi-threaded PDF to SVG conversion (including encrypted PDFs), as well as SVG to PDF conversion"
url="https://github.com/wszqkzqk/${pkgname}"
arch=('x86_64' 'aarch64' 'riscv64' 'loong64')
license=(LGPL-2.1-or-later)
depends=(
    cairo
    glib2
    librsvg
    pango
    poppler-glib
)
makedepends=(
    git
    help2man
    meson
    vala
)

source=("git+https://github.com/wszqkzqk/${pkgname}.git#tag=${pkgver}")
sha256sums=('5fa54e0ea26e4c44fef0bce5f66fde28943f7ef5a0fe2ff1ac8b5bb97f905385')

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
