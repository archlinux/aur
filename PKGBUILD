# Maintainer: Charles Delfly <charles@delfly.fr>
pkgname=openfortigui
pkgver=0.4.2
pkgrel=1
pkgdesc="OpenFortiGUI is an open-source VPN-Client to connect to Fortigate VPN-Hardware. It is based on openfortivpn and adds an easy to use and nice GUI on top of it, written in Qt5."
arch=('i686' 'x86_64')
url="https://github.com/theinvisible/openfortigui.git"
license=('GPL3')
groups=()
depends=('qt5-base' 'openssl' 'ppp' 'sudo')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=()
conflicts=()
replaces=()
options=()
install=
source=("git+https://github.com/theinvisible/$pkgname.git#tag=v$pkgver")
noextract=()
md5sums=('SKIP')

prepare() {
 cd "$srcdir/$pkgname"
}

build() {
	cd "$srcdir/$pkgname"
	cd openfortigui
	git submodule init
	git submodule update
	cd qtinyaes
	git submodule init
	git submodule update
	cd ../..
	qmake
	make -j8
}


check() {
	cd "$srcdir/$pkgname"
	make -k check
}

package() {
	cd "$srcdir/$pkgname/openfortigui"
	mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/pixmaps $pkgdir/usr/share/applications $pkgdir/etc/sudoers.d $pkgdir/etc/openfortigui/vpnprofiles
	install -m 755 openfortigui $pkgdir/usr/bin/
	install -m 440 sudo/openfortigui $pkgdir/etc/sudoers.d
	install -m 644 app-entry/openfortigui.png $pkgdir/usr/share/pixmaps/
	install -m 644 app-entry/openfortigui.desktop $pkgdir/usr/share/applications/
}


