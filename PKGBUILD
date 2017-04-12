# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Black_Codec <orso.f.regna@gmail.com>

pkgname=guacamole-server
pkgver=0.9.12
pkgrel=1
pkgdesc="Guacamole proxy daemon"
arch=('i686' 'x86_64')
url="http://guacamole.sourceforge.net/"
license=('GPL3')
replaces=('guacd' 'libguac' 'libguac-client-ssh' 'libguac-client-vnc' 'libguac-client-rdp')
depends=('pango' 'openssl' 'libvorbis' 'uuid' 'libwebp')
makedepends=('libpulse' 'libvorbis' 'openssl' 'libssh' 'libvncserver' 'pango' 'libtelnet' 'freerdp')
optdepends=('libssh: for ssh protocol support'
'libvncserver: for vnc protocol support'
'freerdp: for rdp protocol support'
'libpulse: for pulseaudio support'
'libtelnet: for telnet protocol support'
)

source=("http://downloads.sourceforge.net/project/guacamole/current/source/$pkgname-$pkgver-incubating.tar.gz" 'guacd.service')
 
md5sums=('b60b2fbf237844c74f796b8d02abe420'
         'dfaa29349d2e73af6dac75d6cafbd762')
 
build() {
	cd "$srcdir"/$pkgname-$pkgver-incubating
 	./configure --prefix=/usr --sbindir=/usr/bin CPPFLAGS="-Wno-error=pedantic -Wno-deprecated-declarations"
	make
}
 
package() {
	cd "$srcdir"/$pkgname-$pkgver-incubating
	make DESTDIR="$pkgdir" install
        mkdir -p "$pkgdir"/usr/lib/systemd/system/
        install -Dm644 "$srcdir"/guacd.service "$pkgdir"/usr/lib/systemd/system/
}
