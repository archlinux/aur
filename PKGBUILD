# Maintainer: Frank Lenormand <lenormf at gmail dot com>
pkgname=kakoune
pkgver=2018.04.13
pkgrel=1
pkgdesc="Multiple-selection, UNIX-flavored modal editor"
arch=("any")
url="http://kakoune.org/"
license=("custom:unlicense")
conflicts=("kakoune-git")

depends=("ncurses")
optdepends=(
    "file: MIME-type based file format detection"
    "aspell: spell checking support"
    "clang: C/C++ completion and diagnostics support"
    "ranger: filesystem explorer"
    "tmux: splitting and creating windows"
    "universal-ctags-git: provides \`readtags\` used to jump to a symbol's definition"
    "xdotool: X11 utility to focus arbitrary kakoune clients"
    "xorg-xmessage: display debug messages in a new window"
)
makedepends=(
    "asciidoc"
    "make"
    "pkg-config"
)
source=("https://github.com/mawww/kakoune/archive/v${pkgver}.tar.gz")
sha256sums=("dfbaf87479ae30fd87426ae1b5f6cbe4382d6fe17b64a0c58d9475bf038e50dc")

check() {
    cd "${srcdir}/${pkgname}-${pkgver}/src"

    make debug=no test
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/src"

    make debug=no
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/src"

    make debug=no install-strip DESTDIR="${pkgdir}" PREFIX=/usr
    install -D ../UNLICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
