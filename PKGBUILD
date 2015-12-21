# Maintainer: Bjoern Franke <bjo@nord-west.org>

pkgname=tvheadend

pkgver=4.0.8
pkgrel=1
pkgdesc="TV streaming server for Linux"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://tvheadend.org/projects/tvheadend"
license=('GPL3')
depends=('avahi' 'linuxtv-dvb-apps' 'openssl' 'python2' 'ffmpeg' 'uriparser')
makedepends=('git')
optdepends=('xmltv: For an alternative source of programme listings'
	    'libhdhomerun: support for HDHomeRun devices')
provides=('tvheadend')
conflicts=('tvheadend' 'hts-tvheadend' 'hts-tvheadend-svn' 'hts-tvheadend-git' 'tvheadend-git')
install=tvheadend.install

source=("https://github.com/tvheadend/tvheadend/archive/v$pkgver.tar.gz" 
	'tvheadend.service')
sha512sums=('b506dfbb5a4bbb44e772953cbd9bbdd8fdd3d5d22e13977ea5b186eb61a421c32196ab92d2f851907e48880b1fd2d543cbee95ba0004e4040fa0064156775e59'
            '456084a08ce0e02a4a32d67a8a7937d45695cb4b08b29297ead8a7e9d2a92963335f653f56d4c9346f4b2729868408fafbcd4caebf9fc8cdaa90171514cf4a57')
 
prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --python=python2
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
    chmod 0644 ${pkgdir}/usr/share/man/man1/tvheadend.1
    install -D -m 644 "$srcdir/tvheadend.service" "$pkgdir/usr/lib/systemd/system/tvheadend.service"
}
