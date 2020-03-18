# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Black_Codec <orso.f.regna@gmail.com>

pkgname=guacamole-server
pkgver=1.1.0
pkgrel=1
pkgdesc="Guacamole proxy daemon"
arch=('i686' 'x86_64' 'armv7h')
url="http://guacamole.sourceforge.net/"
license=('GPL3')
replaces=('guacd' 'libguac' 'libguac-client-ssh' 'libguac-client-vnc' 'libguac-client-rdp')
depends=('pango' 'openssl' 'libvorbis' 'uuid' 'libwebp')
makedepends=('libpulse' 'libvorbis' 'openssl' 'libssh' 'libvncserver' 'pango' 'libtelnet')
optdepends=('libssh: for ssh protocol support'
'libvncserver: for vnc protocol support'
'freerdp: for rdp protocol support'
'libpulse: for pulseaudio support'
'libtelnet: for telnet protocol support'
'monospace: any monospace font such as terminus-font, ttf-inconsolata or ttf-fira-mono. Without it, SSH will not work'
'libwebsockets: Support for Kubernetes'
)
install=$pkgname.install

source=("http://apache.org/dyn/closer.cgi?action=download&filename=guacamole/${pkgver}/source/${pkgname}-${pkgver}.tar.gz")
 
md5sums=('ce4e8926f3c2e7d75c0d767a7cdce7f9')

prepare() {
        cd "$srcdir"/$pkgname-$pkgver
}

build() {
	cd "$srcdir"/$pkgname-$pkgver
	#PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig \
	#CFLAGS+=" -I/usr/include/openssl-1.0" \
	#LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl" \
	./configure --prefix=/usr --sbindir=/usr/bin --with-systemd-dir=/usr/lib/systemd/system CPPFLAGS="-Wno-error=pedantic"
	make
}
 
package() {
	cd "$srcdir"/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
