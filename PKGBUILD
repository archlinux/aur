# Contributor: Calogero e Angelo Scarnà <info@codelinsoft.it>
pkgname=fabariagest
pkgver=1.1
pkgrel=1
pkgdesc="Gestionale aziendale." 
url="http://fabariagest.codelinsoft.it/"
arch=('i686' 'x86_64')
depends=('qt5-base' 'qt5-connectivity' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-multimedia' 'qt5-svg' 'qt5-tools'  'qt5-translations' 'qt5-webkit' 'qt5-websockets' 'qt5-x11extras' 'qt5-xmlpatterns' 'mysql' 'cmake' 'qwt' 'python2' 'python2-pyqt4' 'python2-sip' 'python-sip' )
license=(LGPL)
source=('http://www.codelinsoft.it/sito/download/categoria-linux/categoria-linux-fabariagest/fabariagest-1-1targz.raw')
md5sums=("e0257d8323499fce44afe74502503e47")




build() {
cd "${srcdir}/${pkgname}-${pkgver}"
cmake -DCMAKE_INSTALL_PREFIX=/opt -DWANT_QT5=ON 
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

cp -rv   "${srcdir}/${pkgname}-${pkgver}/fabaria/dropbox/dialogo.py" "${pkgdir}/opt/fabaria_gest/dropbox"
cp -rv   "${srcdir}/${pkgname}-${pkgver}/fabaria/dropbox/settings.py" "${pkgdir}/opt/fabaria_gest/dropbox"
cp -rv   "${srcdir}/${pkgname}-${pkgver}/fabaria/dropbox/mainwindow.py" "${pkgdir}/opt/fabaria_gest/dropbox"
cp -rv   "${srcdir}/${pkgname}-${pkgver}/fabaria/dropbox/mainwindow.ui" "${pkgdir}/opt/fabaria_gest/dropbox"
cp -rv   "${srcdir}/${pkgname}-${pkgver}/fabaria/dropbox/fabaria_rc.py" "${pkgdir}/opt/fabaria_gest/dropbox"


/usr/bin/curl "https://bootstrap.pypa.io/get-pip.py" -o "/tmp/get-pip.py"
sudo	/usr/bin/python2.7 /tmp/get-pip.py
sudo	pip2.7 install dropbox 
}


