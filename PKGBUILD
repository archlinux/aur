# Maintainer: Jean-Baptiste Delisle <jb dot delisle at aliceadsl dot fr>
pkgname=bed-latex
pkgver=1.2
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
source=("bed-$pkgver.tar.gz::https://framagit.org/delisle/bed/repository/archive.tar.gz?ref=v$pkgver")
md5sums=('983502f965be8a950001e775270860a5')
tag=cac10d48cf5a5b896280990d94e0af7ee44ada88

prepare() {
  cd bed-v$pkgver-$tag
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

    cd bed-v$pkgver-$tag
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
