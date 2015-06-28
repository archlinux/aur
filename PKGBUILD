# Maintainer: Michele Mocciola <mickele>
pkgname=gibi
pkgver=2000
pkgrel=3
pkgdesc="Mesh tool and Postprocessor for CAST3M, to be used within Code aster"
url="http://www.code-aster.org/telechargement/tele_prod.php?prod=gibi&liste=all"
license="custom: Free for use within Code Aster"
depends=('python2' 'ncurses' 'libx11' 'time')
source=('http://www.code-aster.org/FICHIERS/aster-full-src-11.3.0-3.noarch.tar.gz')
arch=('i686' 'x86_64')
options=(!strip)

build() {
    cd "${srcdir}/aster-full-src-11.3.0"
    sed -e "s|should_continue()|# should_continue()|g" -i setup.py
    sed -e "s|PREFER_SHARED_LIBS=False|PREFER_SHARED_LIBS=True|" -i setup.cfg
}

package() {
    cd "${srcdir}/aster-full-src-11.3.0"

    python2 setup.py install --prefix="${pkgdir}/opt/aster" gibi

    sed -e "s|python|python2|" -i "${pkgdir}/opt/aster/public/gibi-2000/gibi_aster.py"

    rm -rf "${pkgdir}/opt/aster/bin"
}
md5sums=('d97475885b54a4e514c486da83cfeca6')
