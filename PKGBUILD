# Maintainer: Yoann Ono Dit Biot <yoann.onoditbiot@gmail.com>
# Co-Maintainer: Maxence Sartiaux <contact+aur@makz.me>
pkgname=pydio-sync
pkgver=1.2.7
pkgrel=6
pkgdesc="Pydio synchronisation client"
arch=('i686' 'x86_64')
url="https://pydio.com"
license=('GPL3')
conflicts=('pydio-sync-git' 'pydio-sync-ui-git' 'pydio-sync-latest')
provides=('pydio-sync')
options=(!strip)
depends=('qt5-webkit' 'libsm' 'gnome-keyring' 'libgnome-keyring')
source=("https://download.pydio.com/pub/pydio-sync/release/$pkgver/PydioSync-Linux-Binaries-v$pkgver.tar.gz"
        "pydio.desktop"
	"pydio-sync.png")
md5sums=('9b5264460b1257115d2335685c86c64c'
         '3d965c2199fc920e1828b1e0672a8ad1'
	 'a508ee9d2fa6d48f2553d545be891bff')


package() {
	cd "$srcdir"
	mkdir -p $pkgdir/opt/$pkgname/{pydio-agent,pydio-ui}

	cp $srcdir/pydio-agent/pydio-agent $pkgdir/opt/$pkgname/pydio-agent/
	cp $srcdir/pydio-ui/pydio-ui $pkgdir/opt/$pkgname/pydio-ui/

	
	mkdir -p $pkgdir/usr/share/applications
        install -Dm644 pydio.desktop $pkgdir/usr/share/applications/
	install -D -m644 "${srcdir}/pydio-sync.png"     "${pkgdir}/usr/share/pixmaps/pydio-sync.png"
        mkdir -p $pkgdir/usr/bin
	ln -s /opt/$pkgname/pydio-ui/pydio-ui $pkgdir/usr/bin/pydio-sync
}
