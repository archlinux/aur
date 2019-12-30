# Maintainer: effeffe <filippo.falezza at outlook dot com>
# Contributor: saxonbeta <saxonbeta at gmail dot com>
# Contributor: sofasurfer <sofasurfer at gmail dot com>
# Contributor:vicp74 <v1c70rp at gmail dot com>

pkgname=qtiplot-opj
pkgver=0.9.8.9
pkgrel=15
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
"gsl2.patch"
"ColorMapEditor.patch"
"ConfigDialog.patch"
"FitDialog.patch"
"LayerDialog.patch"
"PlotDialog.patch"
"MatrixValuesDialog.patch"
"TableDialog.patch"
"SetColValuesDialog.patch"
)

noextract=("opj.tar.bz2"
	   "QTeXEngine-0.3-opensource.zip"
)

sha256sums=('a523ea259516d7581abaf2fe376507d152db32f71d88176cff18f5bc391b9ef0'
            'fc60c18bd0af5947d2d7dbc3d1b5b16ed251d9f317cc548228347f081a0b67d5'
            '6b022dab98511f39eb90e90a0d45d71b8edc5216696f236303638548469d0b61'
            '0dbe4be9c34d10e64b12251135538f86c7998890233604f2e8ecb3d5d57b230e'
            '6052482d474e7a52a7aa25c881a1ed90dc9d5aa2fbc79bf5492e7225335d1a1e'
            '76b9c82c96dbc19ccb27ac9ad445d69fe6cf5a4578007cb4454d123cfb1fde49'
            'a2c55d6cc2bbb81e0512e553947a52fc4d33534d10e23cffb4bc2b987315f364'
            '1082beecc11117b28ca546c84f43004c5f7fd55e46087dbd40ed3b4c7491e6cd'
            'd4e4c9f224ca8aeb7f06fe0c5fc501094ae3ae94f5054c8c6acc90b6b3986e75'
            '01838b7c4a13dd368ccfef30a5348df9bef83d98fafe54c129428bd88857fff2'
            '9656b5de3c31dfc86940c72e7362db13127e252b13522c6eec8f438f71d0ae65'
            'dc3bbb78602fa4aafb59c7b33080ac7fe160d2b88c0e296f2b99b1a738d2e972'
            'def2ac188d45611e3f3822014edcf5103969f6e10a89e7f14f298dae35b57913'
            '42239a26459d5892fe59bcdc3057d9a946e5f416b4e791f7ce130a0aa7d139ce'
            '1f1938cb40b51b4ef4b5266941a8a679c1bb49ada5090105665949ef8f5ca3a3'
			'd52482c530a9e61e5580141d3708e829140c78f7839f8d8cfcf2e63e581c1804'
			'e5476599521289928e50462f6c9080185581f0c15b2dc274c96ca2c1fd8fa72a'
			'da119d0d4abdf8954f7fc52efc9fc738897e4bdcc9b767444e549fb00a62578a'
			'2427a152acdbe312211b7d57e73d47e9cd7f698440952784de6db4c0429cea22'
			"5eda5e19bf54fe00e15082987fd6a3e6833a393773fb35e6bd89d453f3585a3f"
			"ce01c40744dbccdb1296c4c9d83f0c75a83fae22a1a1ef58d8ce385ff4b970f6"
			"4b24e70d6abc155e8b6b74fc68bdd2c535a2716bb5eae5b9ab59d24f6b599dd6"
			"ccd3ce2fb5230cdccd34706be7b20124b860ff4daedc334f90ed94f99e2c3217")
			
prepare() {
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
patch -p0 < gsl2.patch
patch -p0 < FitDialog.patch
patch -p0 < ConfigDialog.patch
patch -p0 < ColorMapEditor.patch
patch -p0 < LayerDialog.patch
patch -p0 < PlotDialog.patch
patch -p0 < MatrixValuesDialog.patch
patch -p0 <	SetColValuesDialog.patch
patch -p0 < TableDialog.patch
cp build.conf qtiplot-${pkgver}/

}

build() {

	cd "$srcdir/qtiplot-${pkgver}"

	lrelease-qt4 qtiplot/translations/*
	# fix stuff
	sed -i 's|/usr/local/|/usr/share/|' qtiplot.pro
	sed -i 's|<QAssistantClient>|<QtAssistant/qassistantclient.h>|' qtiplot/src/core/ApplicationWindow.cpp
	sed -i 's#d_python_config_folder + "#"/usr/share/qtiplot#' qtiplot/src/core/ApplicationWindow.cpp

	qmake-qt4 qtiplot.pro QMAKESPEC=linux-g++ QMAKE_CXXFLAGS+="-std=c++11" CONFIG+="liborigin python"
	make QTDIR=/usr/ QMAKESPEC=linux-g++

}
package() {
cd "$srcdir/qtiplot-${pkgver}"

INSTALL_ROOT=${pkgdir} make install

install -D -m644 "${srcdir}/qtiplot-${pkgver}/qtiplot_logo.png" "${pkgdir}/usr/share/pixmaps/qtiplot_logo.png"
install -D -m644 "${srcdir}/qtiplot.desktop" "${pkgdir}/usr/share/applications/qtiplot.desktop"
install -D -m644 "${srcdir}/qtiplot.xml" "${pkgdir}/usr/share/mime/packages/qtiplot.xml"

}
