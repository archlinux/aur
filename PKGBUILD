# Contributor: Calogero e Angelo Scarnà <info@codelinsoft.it>
# Update and change name fabariagest to fabaria_gest
pkgname=fabaria
pkgver=2.0
pkgrel=3
pkgdesc="Gestionale aziendale." 
url="https://www.codelinsoft.it/sito/2013-11-17-17-56-34/fabariagest.html"
arch=('i686' 'x86_64')
depends=('qt5-base' 'qt5-connectivity' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-multimedia' 'qt5-svg' 'qt5-tools'  'qt5-translations' 'qt5-webkit' 'qt5-websockets' 'qt5-x11extras' 'qt5-xmlpatterns' 'mysql' 'cmake' 'zlib' 'nspr' 'lsb-release' )
license=(LGPL)
source=('https://www.codelinsoft.it/sito/download/categoria-linux/categoria-linux-fabariagest/fabariagest-2-0targz')
md5sums=("SKIP")

build() {
cd "${srcdir}/fabariagest-${pkgver}"
cmake -DCMAKE_INSTALL_PREFIX=/opt/fabaria_gest -DCMAKE_INSTALL_LIBDIR=/opt/fabaria_gest/lib 
make -j5
}

package() {
cd ${srcdir}/fabariagest-${pkgver}
make DESTDIR=$pkgdir install
install -d "$pkgdir"/opt/fabaria_gest/installdb/
install -d "$pkgdir"/opt/fabaria_gest/updatedb/
install -d "$pkgdir"/opt/fabaria_gest/lib/
cp -rv  "${srcdir}/fabariagest-${pkgver}/fabaria/installdb/install_db.sql" "${pkgdir}/opt/fabaria_gest/installdb/"
cp -rv  "${srcdir}/fabariagest-${pkgver}/fabaria/updatedb/update_db.sql" "${pkgdir}/opt/fabaria_gest/updatedb/"
cp -rv  "${srcdir}/fabariagest-${pkgver}/fabaria/images/logo4.png" "${pkgdir}/opt/fabaria_gest/"
}

post_install() {
sudo chmod 777 /usr/bin/fabaria
} 
