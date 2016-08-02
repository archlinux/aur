# Maintainer: Stefan Tatschner <rumpelsepp@sevenbyte.org>

pkgname='pynote'
pkgver=2.1.1
pkgrel=2
pkgdesc="Manage notes on the commandline"
arch=('any')
url="https://github.com/rumpelsepp/pynote"
license=('MIT')
provides=('pynote')
depends=('python' 'python-tabulate' 'python-arrow')
makedepends=('asciidoctor')
conflicts=('pynote-docs' 'pynote-git' 'pynote-docs-git')
source=("git+https://github.com/rumpelsepp/pynote#tag=v$pkgver")
sha256sums=('SKIP')
install=pynote.install

build() {
    cd "${srcdir}/${pkgname}/man"
    make ASCIIDOC_MAN_FLAGS=" -d manpage -b manpage -a reproducible" man
}

package() {
    cd "${srcdir}/${pkgname}"

    install -D "man/note.1"   "${pkgdir}/usr/share/man/man1/note.1"
    install -D "man/noterc.5" "${pkgdir}/usr/share/man/man5/noterc.5"

    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
