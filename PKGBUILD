# Maintainer: Aztorius <william.bonnaventure at gmail dot com>
# Maintainer: ZeroDot1 <zerodot1 at bk dot ru>
pkgname=magicfountain
pkgver=1.0.0alpha6
pkgrel=2
pkgdesc="A Fountain syntax editor and viewer."
arch=('i686' 'x86_64')
url="https://github.com/Aztorius/magicfountain"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
optdepends=('qt5-translations')
makedepends=('qt5-base')

source=("https://github.com/Aztorius/magicfountain/archive/${pkgver}.tar.gz")
md5sums=('b016b94cffce4887c2852387a082fab0')

prepare() {
        cd ${srcdir}/${pkgname}-${pkgver}
        sed -i "s/\/usr\/local/\/usr/g" ./magicfountain.pro
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	qmake PREFIX='/usr' LIBDIR='/usr/lib' magicfountain.pro
        make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make INSTALL_ROOT="$pkgdir/" install
	mkdir -p "$pkgdir/usr/share/applications/"
	cp ./magicfountain.desktop "$pkgdir/usr/share/applications/"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
	cp ./magicfountain.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
}
