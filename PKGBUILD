# Maintainer: saxonbeta <saxonbeta at gmail dot com>
# Contributor: sofasurfer <sofasurfer at gmail dot com>
# Contributor:vicp74 <v1c70rp at gmail dot com>

pkgname=qtiplot-opj
pkgver=0.9.8.9
pkgrel=12
pkgdesc="Data analysis and scientific plotting - free clone of Origin, with Origin import enabled"
# more info in: http://www.staff.science.uu.nl/~zeven101/qtiplot.html
arch=('i686' 'x86_64')
url="http://soft.proindependent.com/qtiplot.html"
license=('GPL2')
depends=('muparser' 'gsl' 'python2-pyqt' 'boost-libs' 'shared-mime-info' 'glu' 'liborigin2' \
	'qt-assistant-compat' 'tamu-anova' 'python2')
makedepends=('pkgconfig' 'unzip' 'boost')
provides=('qtiplot')
conflicts=('qtiplot')
options=('!makeflags')
install=${pkgname}.install

source=("http://downloads.sourceforge.net/project/qtiplot.berlios/qtiplot-${pkgver}.tar.bz2"
"http://downloads.sourceforge.net/project/qtiplot.berlios/QTeXEngine-0.3-opensource.zip"
"opj.tar.bz2"
"qtiplot.patch"
"qtiplot-0.9.8.9-set_col_values.patch"
"qtiplot-0.9.8.9-image_widget.patch"
"qtiplot-0.9.8.9-FFT.patch"
"qtiplot-0.9.8.9-FFTcpp.patch"
"qtiplot-0.9.8.9-dialog.patch"
"qtiplot.desktop"
"qtiplot.xml"
"qtiplot-opj.install"
"build.conf"
"pyqt4.patch"
)

noextract=("opj.tar.bz2"
	   "QTeXEngine-0.3-opensource.zip"
)

md5sums=('652096a365851da3b5f6fefdcbe2aaec'
'd1b234623770ec6209b14d1b5137f2f1'
'8a6bdb368ab264e36a5210d8ce0f5439'
'c84feb6ed8836ed5868b3fe5887dc1c3'
'a0a9a28722d8c58c6e3f5bea816eed09'
'23c4758e557c30c791c332ece6f63f0d'
'66ab87e227dc1436d8a08adaef657d74'
'354648b6702d7b7fb71d7d230b6a9bbf'
'a433c4c2187a0a988ed849e486349297'
'6e990ff9c3a456b446b581492ddf669c'
'35683f3b32e1edcca0bb02c471d284e9'
'58b7f423e59db7764f53988cdbd7308e'
'b5e7832b05c991c80b83964670d00af8'
'd71623b74a9264225a438553f230cc40'
)

build() {
cd "$srcdir"

tar xf qtiplot-${pkgver}.tar.bz2
tar xvf opj.tar.bz2 -C qtiplot-${pkgver}/
unzip -o QTeXEngine-0.3-opensource.zip -d qtiplot-${pkgver}/3rdparty

patch -p0 < qtiplot-0.9.8.9-set_col_values.patch
patch -p0 < qtiplot-0.9.8.9-image_widget.patch
patch -p0 < qtiplot-0.9.8.9-FFT.patch
patch -p0 < qtiplot-0.9.8.9-FFTcpp.patch
patch -p0 < qtiplot-0.9.8.9-dialog.patch
patch -p0 < qtiplot.patch
patch -p0 < pyqt4.patch
cp build.conf qtiplot-${pkgver}/
cd "qtiplot-${pkgver}"
lrelease-qt4 qtiplot/translations/*
qmake-qt4 qtiplot.pro
make

}
package() {
cd "$srcdir/qtiplot-${pkgver}"

INSTALL_ROOT=${pkgdir} make install

install -D -m644 "${srcdir}/qtiplot-${pkgver}/qtiplot_logo.png" "${pkgdir}/usr/share/pixmaps/qtiplot_logo.png"
install -D -m644 "${srcdir}/qtiplot.desktop" "${pkgdir}/usr/share/applications/qtiplot.desktop"
install -D -m644 "${srcdir}/qtiplot.xml" "${pkgdir}/usr/share/mime/packages/qtiplot.xml"

}
