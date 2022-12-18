# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Denis Kasak <dkasak AT termina DOT org DOT uk>

pkgname=polyfile
pkgver=0.5.0
pkgrel=1
pkgdesc="A utility to identify and map the semantic structure of files, including polyglots, chimeras, and schizophrenic files."
arch=(any)
url=https://github.com/trailofbits/polyfile
license=(LGPL3)
depends=(python python-graphviz python-intervaltree python-jinja
         python-kaitaistruct python-networkx python-pdfminer
         python-pillow python-yaml python-cint-git)
makedepends=(git python-setuptools)
source=("git+https://github.com/trailofbits/polyfile.git#tag=v${pkgver}"
        "git+https://github.com/kaitai-io/kaitai_struct_formats.git"
        "git+https://github.com/file/file.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
prepare() {
    cd "$srcdir/polyfile"
    git submodule init
    git config submodule.kaitai_struct_formats.url "$srcdir/kaitai_struct_formats"
    git config submodule.file.url "$srcdir/file"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/polyfile"
    python setup.py build
}

package() {
    cd "$srcdir/polyfile"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
