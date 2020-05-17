# Maintainer: Konstantin Kogan <kostyalamer@yandex.ru>
# Contributor: Konstantin Kogan <kostyalamer@yandex.ru>
pkgname=openpref
pkgver=0.1.3
pkgrel=2
epoch=1
pkgdesc="OpenPref - Preference game for linux"
arch=('x86_64')
url="http://sourceforge.net/projects/openpref/"
license=('GPL3')
groups=('games')
makedepends=('cmake')
depends=('qt4')
source=("http://altlinuxclub.ru/arhiv/openpref/${pkgname}-${pkgver}.tar.gz"
 		"http://altlinuxclub.ru/arhiv/openpref/openpref.desktop" 
        "http://altlinuxclub.ru/arhiv/openpref/openpref-0.1.3-alt-locale.patch" )
md5sums=('7b51607c2145f0063f405e159c6410bf'
         '095603e7fb84f081a8b2a3234fbdc4c9'
         'f1b06bb75de75169e2dfcb5c0cac02d1')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 < "${srcdir}/${pkgname}-${pkgver}-alt-locale.patch"
}

build() {
    cd "$pkgname-$pkgver"
    cmake .
    make prefix=/usr
  
}

package() {
    cd "$pkgname-$pkgver"
make prefix=/usr DESTDIR="$pkgdir" install
install -Dm755 openpref \
"$pkgdir/usr/bin/openpref" 
cd ${srcdir}
install -D ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
install -Dm644 ${pkgdir}/usr/local/share/openpref/i18n/openpref_ru.qm ${pkgdir}/usr/share/openpref/openpref_ru.qm
rm -r  ${pkgdir}/usr/local 

}
