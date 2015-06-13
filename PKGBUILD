# Maintainer: Benoît Giraudou <bgiraudou@gmail.com>
pkgname=agclient
pkgver=10.2
pkgrel=1
pkgdesc="A client to connect to an Appgate server."
arch=('i686' 'x86_64')
url="http://tech.cryptzone.com/"
license=('BCL')
depends=('java-runtime')
source=(http://tech.cryptzone.com/download/AppGate-$pkgver/appliance/Clients/Linux/$pkgname.i386.tar.bz2
		agclient.desktop
		agcicon.gif)
sha256sums=('d365bc1d7613285ddfd11603e7c947404789238c5c5787feafa49babf041796d'
			'4f9e4828a6e54d05815d134139b0ee6ca3d68d3c7dc5a64f1cd4f5dd29cc6b31'
			'cd3f533e61b5627f63bc8b56e2f23aaf4ab8cf98184d483338d9c30b51a6cb4b')

build() {
	cat > "${srcdir}/${pkgname}" << EOF
#!/bin/sh
/usr/share/java/APPGclnt/bin/${pkgname}
EOF
}

package() {
	install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm644 ${srcdir}/agcicon.gif ${pkgdir}/usr/share/pixmaps/agcicon.gif

	install -dm755 ${pkgdir}/usr/share/java/APPGclnt
	install -dm755 ${pkgdir}/usr/share/java/APPGclnt/bin
	install -dm755 ${pkgdir}/usr/share/java/APPGclnt/lib
	install -Dm644 ${srcdir}/opt/APPGclnt/*.html ${pkgdir}/usr/share/java/APPGclnt
	install -Dm755 ${srcdir}/opt/APPGclnt/bin/* ${pkgdir}/usr/share/java/APPGclnt/bin
	install -Dm644 ${srcdir}/opt/APPGclnt/lib/* ${pkgdir}/usr/share/java/APPGclnt/lib

	install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}