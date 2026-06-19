# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: J. Emiliano Deustua <edeustua@gmail.com>
# Contributor: Gabriel Brown <gabriel.h.brown@gmail.com>

_pkgauthor=chapel-lang
_pkgname=chapel
pkgname=${_pkgname}
pkgver=2.9.0
pkgrel=1
pkgdesc="Programming language designed for productive parallel computing at scale"

_github="https://github.com/${_pkgauthor}/${_pkgname}"
url="https://chapel-lang.org/"
license=('Apache-2.0')
arch=('x86_64')

provides=("${pkgname}")
conflicts=("${pkgname}"{-git,-bin})

makedepends=('git' 'cmake' 'clang')
depends=('glibc' 'libstdc++' 'bash' 'ncurses' 'llvm-libs' 'lldb' 'perl' 'python' 'python-overrides' 'python-sphinx_rtd_theme')

options=('!debug' '!lto')

source=("${_pkgname}-${pkgver}.tgz::${_github}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d91ececfc070f0e94c979dd08cdd3f6da84db4ee48fe06f3187ad259ea9553e7')


prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit

    ./configure --prefix="/usr"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit

    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit

    export PATH="$srcdir/${pkgname}-${pkgver}/bin/linux64-x86_64:$PATH"
    make check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit

    make DESTDIR="${pkgdir}" install
}
