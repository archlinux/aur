# Maintainer: bziemons <ben@rs485.network>
pkgname=chr-editor-git
pkgver=r652.b3a4c07
pkgrel=1
pkgdesc="Console-based editor designed for simplified use like gedit"
arch=("x86_64")
url="https://github.com/istoph/editor"
license=('Boost')
depends=('tuiwidgets-git' 'qt5-base' 'icu' 'gcc-libs')
makedepends=(meson git)
provides=(chr-editor)
conflicts=(chr-editor)
options=(strip)
source=("git+https://github.com/istoph/editor.git")
sha512sums=('SKIP')

pkgver() {
    cd "editor"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson editor _build
    meson compile -C _build
}

check() {
    meson test -C _build
}

package() {
    DESTDIR="$pkgdir" meson install -C _build

    # install manpages
    install -d "${pkgdir}/usr/share/man/man1/"
    install -pm 644 "${srcdir}/editor/manpages/"* "${pkgdir}/usr/share/man/man1"
}
