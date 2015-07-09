# Maintainer: Black_Codec <orso.f.regna@gmail.com>
 
pkgname=guacamole-server
pkgver=0.9.7
pkgrel=1
pkgdesc="Guacamole proxy daemon"
arch=('i686' 'x86_64')
url="http://guacamole.sourceforge.net/"
license=('GPL3')
replaces=('guacd' 'libguac' 'libguac-client-ssh' 'libguac-client-vnc' 'libguac-client-rdp')
depends=('pango' 'openssl' 'libvorbis')
makedepends=('libpulse' 'libvorbis' 'openssl' 'libssh' 'libvncserver' 'pango' 'libtelnet' 'freerdp-guacamole' 'uuid')
optdepends=('libssh: for ssh protocol support'
'libvncserver: for vnc protocol support'
'freerdp-guacamole: for rdp protocol support'
'libpulse: for pulseaudio support'
'libtelnet: for telnet protocol support'
)
 
source=("http://downloads.sourceforge.net/project/guacamole/current/source/$pkgname-$pkgver.tar.gz" 'guacd.service')
 
md5sums=('a09b3fd53e1ecc365a311a380f8c6314' 'dfaa29349d2e73af6dac75d6cafbd762')
 
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
