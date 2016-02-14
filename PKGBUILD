# Contributor: Calogero e Angelo Scarnà <info@codelinsoft.it>
pkgname=lylibrary
pkgver=3.0
pkgrel=1
pkgdesc="LyLibrary provides everything necessary to the books cataloguing, the loans management and the registration of the library readers." 
url="http://www.codelinsoft.it/sito/2013-11-17-17-56-34/lylibrary.html#"
arch=('i686' 'x86_64')
depends=('qt5-base' 'qt5-connectivity' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-multimedia' 'qt5-svg' 'qt5-tools'  'qt5-translations' 'qt5-webkit' 'qt5-websockets' 'qt5-x11extras' 'qt5-xmlpatterns' 'mysql' )
license=(LGPL)
source=(http://www.codelinsoft.it/sito/download/categoria-linux/LyLibrary/lylibrary-3-0targz.raw)
md5sums=("8b67a73af48e515d3d1af5b2c4d83d46")



build() {
cd "${srcdir}/${pkgname}-${pkgver}"
cmake -DCMAKE_INSTALL_PREFIX=/opt -DWANT_QT5=ON
make -j5
}

package() {
cd "${srcdir}/${pkgname}-${pkgver}"
make DESTDIR=$pkgdir install
install -d "$pkgdir"/opt
install -dm 755 ${pkgdir}/opt/lylibrary
cp -rv  "${srcdir}/${pkgname}-${pkgver}/lylibrary/lylibrary" "${pkgdir}/opt/lylibrary"
cp -rv  "${srcdir}/${pkgname}-${pkgver}/lylibrary/images/logo4.png" "${pkgdir}/opt/lylibrary/"
install -m 755 -d "${pkgdir}/opt/lylibrary/plugin"

install -Dm644  "${srcdir}/${pkgname}-${pkgver}/lylibrary/desktop/lylibrary.desktop" "${pkgdir}/usr/share/applications/lylibrary.desktop"

cp -rv  "${srcdir}/${pkgname}-${pkgver}/lylibrary/plugin/" "${pkgdir}/opt/lylibrary/"





}

