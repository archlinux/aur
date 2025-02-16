# Maintainer: Zhou Qiankang <wszqkzqk@qq.com>

pkgname=pdf-svg-conv
pkgver=0.1.3
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
sha256sums=('62dec7c465c2e950406c5d1693c95c7fdcf6ceade36141d5668651e870bac499')

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
