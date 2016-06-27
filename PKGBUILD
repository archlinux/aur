# Maintainer:   saxonbeta <saxonbeta at gmail dot com>
# Contributor:  sofasurfer <sofasurfer at gmail dot com>
# Contributor:  vicp74 <v1c70rp at gmail dot com>
# Contributor:  Salamandar <felix@piedallu.me>

pkgname=qtiplot-git
pkgver=0.9.8.9
pkgrel=1
pkgdesc="Data analysis and scientific plotting - free clone of Origin, with Origin import enabled"
# more info in: http://www.staff.science.uu.nl/~zeven101/qtiplot.html
arch=('i686' 'x86_64')
url="http://soft.proindependent.com/qtiplot.html"
license=('GPL2')
depends=(   'muparser' 'gsl' 'python2-pyqt' 'boost-libs' 'shared-mime-info'
            'glu' 'liborigin2' 'qt-assistant-compat' 'tamu-anova' 'python2'
            'qwt' 'qwtplot3d')
makedepends=('pkgconfig' 'unzip' 'boost')
provides=('qtiplot')
conflicts=('qtiplot' 'qtiplot-opj')

install=${pkgname}.install

source=("git+https://github.com/Salamandar/qtiplot.git#branch=refactor_build_system"
        "build.conf"
        "qtiplot.desktop"
        "${pkgname}.install"
        "qtiplot.xml"
)

sha256sums=('SKIP'
            'SKIP'
            '01838b7c4a13dd368ccfef30a5348df9bef83d98fafe54c129428bd88857fff2'
            'dc3bbb78602fa4aafb59c7b33080ac7fe160d2b88c0e296f2b99b1a738d2e972'
            '9656b5de3c31dfc86940c72e7362db13127e252b13522c6eec8f438f71d0ae65'
)

prepare() {
echo "préparation"
    cp build.conf "$srcdir/qtiplot"
}

build() {
echo "buildage"
    cd "$srcdir/qtiplot"

    lrelease-qt4 qtiplot/translations/*
    qmake-qt4 qtiplot.pro
    make
}

package() {
    cd "$srcdir/qtiplot"
    INSTALL_ROOT=${pkgdir} make install

    install -D -m644 "qtiplot_logo.png" "${pkgdir}/usr/share/pixmaps/qtiplot_logo.png"
    install -D -m644 "../qtiplot.desktop"  "${pkgdir}/usr/share/applications/qtiplot.desktop"
    install -D -m644 "../qtiplot.xml"      "${pkgdir}/usr/share/mime/packages/qtiplot.xml"
}
