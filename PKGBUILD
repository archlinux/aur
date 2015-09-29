# Contributor: Calogero e Angelo Scarnà <info@codelinsoft.it>
pkgname=fabariagest
pkgver=1.0
pkgrel=1
pkgdesc="Gestionale aziendale." 
url="http://fabariagest.codelinsoft.it/"
arch=('i686' 'x86_64')
depends=('qt4' 'mysql' 'cmake' 'qwt' 'python2' 'python2-pyqt4' 'python2-sip' 'python-sip')
license=(LGPL)
source=('http://www.codelinsoft.it/sito/download/categoria-linux/categoria-linux-fabariagest/fabaria-gest-source-code.raw')
md5sums=("4ee70ebf51ad53f667d0b7cde9d0f9cb")




build() {
cd "${srcdir}/${pkgname}-${pkgver}"
cmake -DCMAKE_INSTALL_PREFIX=/opt -DWANT_QT4=ON -DWANT_QWT=ON
make -j5
}

package() {
cd ${srcdir}/${pkgname}-${pkgver}
make DESTDIR=$pkgdir install
install -d "$pkgdir"/opt/fabaria_gest/installdb/
install -d "$pkgdir"/opt/fabaria_gest/updatedb/
cp -rv  "${srcdir}/${pkgname}-${pkgver}/fabaria/installdb/install_db.sql" "${pkgdir}/opt/fabaria_gest/installdb/"
cp -rv  "${srcdir}/${pkgname}-${pkgver}/fabaria/updatedb/update_db.sql" "${pkgdir}/opt/fabaria_gest/updatedb/"
cp -rv  "${srcdir}/${pkgname}-${pkgver}/fabaria/images/logo4.png" "${pkgdir}/opt/fabaria_gest/"

cp -rv   "${srcdir}/${pkgname}-${pkgver}/fabaria/dialogo.py" "${pkgdir}/opt/fabaria_gest/"
cp -rv   "${srcdir}/${pkgname}-${pkgver}/fabaria/settings.py" "${pkgdir}/opt/fabaria_gest"
cp -rv   "${srcdir}/${pkgname}-${pkgver}/fabaria/mainwindow.py" "${pkgdir}/opt/fabaria_gest"
cp -rv   "${srcdir}/${pkgname}-${pkgver}/fabaria/mainwindow.ui" "${pkgdir}/opt/fabaria_gest"
cp -rv   "${srcdir}/${pkgname}-${pkgver}/fabaria/fabaria_rc.py" "${pkgdir}/opt/fabaria_gest"


/usr/bin/curl "https://bootstrap.pypa.io/get-pip.py" -o "/tmp/get-pip.py"
sudo	/usr/bin/python2.7 /tmp/get-pip.py
sudo	pip2.7 install dropbox 
}


