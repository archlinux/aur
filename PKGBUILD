# Maintainer: Jean-Baptiste Delisle <jb dot delisle at aliceadsl dot fr>
pkgname=bed-latex
pkgver=1.3.7
pkgrel=1
pkgdesc="BEd: Beamer Editor, GUI for LaTeX Beamer presentations."
arch=(any)
url="https://framagit.org/delisle/bed"
license=('GPL3')
depends=('python>=3.0' 'python-pyqt5' 'python-poppler-qt5' 'texlive-core' 'texlive-latexextra')
optdepends=('python-pygments')
makedepends=()
conflicts=('bed')
install="bed.install"
source=("bed-$pkgver.tar.gz::https://framagit.org/delisle/bed/-/archive/v${pkgver}/bed-v${pkgver}.tar.gz")
md5sums=('6d4b1f42d20a218b9834b402fffd64aa')

prepare() {
  cd bed-v$pkgver
  sed -i -e "s#/tmp/python3#/usr/bin/python3#" python/bed.py
  sed -i -e "s#/tmp/pdflatex#pdflatex#" python/settings.py
  sed -i 's#/local##g' launcher/bed.desktop
}

package(){
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/bed
    mkdir -p $pkgdir/usr/share/texmf/tex/latex/bed
    mkdir -p $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/pixmaps

    cd bed-v$pkgver
    cp python/*.py $pkgdir/usr/share/bed
    chmod +x $pkgdir/usr/share/bed/bed.py
    cp icons/* $pkgdir/usr/share/bed
    cp translation/*.qm $pkgdir/usr/share/bed
    cp launcher/bed.desktop $pkgdir/usr/share/applications/
    cp latex/bed.sty $pkgdir/usr/share/texmf/tex/latex/bed/
    cd $pkgdir/usr/bin/
    ln -s ../share/bed/bed.py bed
    cd $pkgdir/usr/share/pixmaps
    ln -s ../bed/bed.svg bed.svg
}
