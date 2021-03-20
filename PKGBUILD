# Maintainer: Atilla ÖNTAŞ <tarakbumba@gmail.com>
# Contributor: Leonardo Ferreira Fontenelle <leonardof@gnome.org>

pkgname=virtaal
pkgver=0.7.1
pkgrel=6
pkgdesc="A tool to create program translations."
url="https://translate.sourceforge.net/wiki/virtaal/index"
arch=('any')
license=('GPL')
depends=('python2>2.5' 'gtk2>2.18' 'pygtk>2.12' 'python2-lxml>2.3.2'  'desktop-file-utils'
    'python2-translate-toolkit-lib' 'python2-simplejson' 'python2-pycurl' 'python2-pysqlite' 'hicolor-icon-theme'
)
optdepends=('python2-gtkspell: to enable spell checking'
    'python2-pyenchant: to enable spell checking'
    'iso-codes: to display translated language names'
    'python2-levenshtein: to speed up Levenshtein distance measures'
)
install=virtaal.install
source=("https://downloads.sourceforge.net/translate/$pkgname-$pkgver.tar.bz2")
md5sums=('e931c5b477da4bb44e00c24c2247a1ad')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i -e "s|#![ ]*/usr/bin/python|#!/usr/bin/python2|" \
        -e "s|#![ ]*/usr/bin/env python|#!/usr/bin/env python2|" \
        $(find $srcdir -name "*.py")
    PYTHON=python2 ./setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    PYTHON=python2 ./setup.py install --root=${pkgdir}
}
