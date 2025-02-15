# Contributor: Calogero e Angelo Scarnà <info@codelinsoft.it>
pkgname=lylibrary
#_pkgname=LyLibrary
pkgver=3.1
pkgrel=5
pkgdesc="LyLibrary provides everything necessary to the books cataloguing, the loans management and the registration of the library readers."
url="http://www.codelinsoft.it/sito/2013-11-17-17-56-34/lylibrary.html#"
arch=('x86_64')
depends=('qt5-base' 'qt5-connectivity' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-multimedia' 'qt5-svg' 'qt5-tools'  'qt5-translations' 'qt5-websockets' 'qt5-x11extras' 'qt5-xmlpatterns' 'mariadb' )
license=(LGPL)
source=(https://github.com/specialworld83/archlinux/raw/refs/heads/main/lylibrary-3.1.tar.gz)
md5sums=("SKIP")



build() {
cd "${srcdir}/${pkgname}-${pkgver}"
cmake -DCMAKE_INSTALL_PREFIX=/opt/lylibrary -DCMAKE_INSTALL_LIBDIR=/opt/lylibrary/lib
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
