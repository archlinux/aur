# Maintainer: Zhou Qiankang <wszqkzqk@qq.com>

pkgname=pdf-svg-conv
pkgver=0.1.5
pkgrel=1
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
sha256sums=('4940e596adbf00bbf92214418e544d061cbf58896bab31223e2e6e78d6459281')

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
