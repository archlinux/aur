# Maintainer: Black_Codec <orso.f.regna@gmail.com>
 
pkgname=guacamole-server
pkgver=0.9.8
pkgrel=2
pkgdesc="Guacamole proxy daemon"
arch=('i686' 'x86_64')
url="http://guacamole.sourceforge.net/"
license=('GPL3')
replaces=('guacd' 'libguac' 'libguac-client-ssh' 'libguac-client-vnc' 'libguac-client-rdp')
depends=('pango' 'openssl' 'libvorbis' 'uuid')
makedepends=('libpulse' 'libvorbis' 'openssl' 'libssh' 'libvncserver' 'pango' 'libtelnet' 'freerdp')
optdepends=('libssh: for ssh protocol support'
'libvncserver: for vnc protocol support'
'freerdp: for rdp protocol support'
'libpulse: for pulseaudio support'
'libtelnet: for telnet protocol support'
)
 
source=("http://downloads.sourceforge.net/project/guacamole/current/source/$pkgname-$pkgver.tar.gz" 'guacd.service')
 
md5sums=('5b85fcf9db744788d4aa578e20d5e181' 'dfaa29349d2e73af6dac75d6cafbd762')
 
build() {
	cd "$srcdir"/$pkgname-$pkgver
 	./configure --prefix=/usr --sbindir=/usr/bin
	make
}
 
package() {
	cd "$srcdir"/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install
	mkdir -p "$pkgdir"/etc/systemd/system/
	install -Dm644 "$srcdir"/guacd.service "$pkgdir"/etc/systemd/system/
}
