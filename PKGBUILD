# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname='pynote'
pkgver=1.0.0
pkgrel=3
pkgdesc="Manage notes on the commandline"
arch=('any')
url="https://github.com/rumpelsepp/pynote"
license=('MIT')
provides=('pynote')
depends=('python' 'python-plaintable' 'python-click' 'python-babel')
optdepends=('python-pygments: synthax highlighting support')
makedepends=('python-sphinx' 'python-setuptools')
conflicts=('pynote-docs' 'pynote-git' 'pynote-docs-git')
source=("https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6d4fe9d8234fcc1d09b4cd8d8def1c75745e02c895e2f8fe6e3c3987e3c02cbe')
install=pynote.install

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}/docs"
    make man
    make text
}

package() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    mkdir -p ${pkgdir}/usr/share/man/man1/
    mkdir -p ${pkgdir}/usr/share/man/man5/
    mkdir -p ${pkgdir}/usr/share/doc/pynote/

    cp -ra "docs/man/note.1" "${pkgdir}/usr/share/man/man1/note.1"
    cp -ra "docs/man/noterc.5" "${pkgdir}/usr/share/man/man5/noterc.5"
    cp -ra docs/text/* "${pkgdir}/usr/share/doc/pynote/"

    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
