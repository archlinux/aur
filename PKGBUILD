# Maintainer: Eric Waller <ewwaller+aur@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=chessx-svn
pkgver=1.3.4.2124
pkgrel=1
pkgdesc="A free chess database"
arch=(i686 x86_64)
url=http://chessx.sourceforge.net
license=(GPL2)
depends=(qt5-svg desktop-file-utils qt5-multimedia)
makedepends=(subversion
             qt5-3d
	     qt5-base		
	     qt5-canvas3d
	     qt5-connectivity
	     qt5-declarative
	     qt5-enginio
	     qt5-graphicaleffects
	     qt5-imageformats
	     qt5-location
	     qt5-multimedia
	     qt5-quick1
	     qt5-quickcontrols
	     qt5-script
	     qt5-sensors
	     qt5-serialport
	     qt5-svg
	     qt5-tools
	     qt5-translations
	     qt5-wayland
	     qt5-webchannel
	     qt5-webengine
	     qt5-webkit
	     qt5-websockets
	     qt5-x11extras
	     qt5-xmlpatterns
)

provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!emptydirs)
install=$pkgname.install
source=($pkgname::svn+http://svn.code.sf.net/p/${pkgname%-*}/code/trunk)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    echo $(grep -o 'Version [0-9.]\+' -m1 $pkgname/ChangeLog | tr -d '[a-zA-Z ]').$(svnversion "$SRCDEST"/$pkgname/)
}

prepare() {
    sed -i 's:qm:ts:g' $pkgname/resources.qrc
}

build() {
    cd $pkgname/
    qmake-qt5
    make
}

package() {
    cd $pkgname/
    desktop-file-install unix/${pkgname%-*}.desktop --dir "$pkgdir"/usr/share/applications/
    install -Dm644 data/images/${pkgname%-*}.png "$pkgdir"/usr/share/pixmaps/${pkgname%-*}.png
    install -Dm755 release/${pkgname%-*} "$pkgdir"/usr/bin/${pkgname%-*}
}
