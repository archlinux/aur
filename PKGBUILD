# Maintainer: Bjoern Franke <bjo@nord-west.org>

pkgname=tvheadend

pkgver=4.0.5
pkgrel=1
pkgdesc="TV streaming server for Linux"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://tvheadend.org/projects/tvheadend"
license=('GPL3')
depends=('avahi' 'openssl' 'python2' 'ffmpeg')
makedepends=('git')
optdepends=('xmltv: For an alternative source of programme listings')
provides=('tvheadend')
conflicts=('tvheadend' 'hts-tvheadend' 'hts-tvheadend-svn' 'hts-tvheadend-git' 'tvheadend-git')
install=tvheadend.install

source=("https://github.com/tvheadend/tvheadend/archive/v$pkgver.tar.gz" 
	'tvheadend.service')

sha512sums=('e70eb42cc76b4fbe7ca3445ec41f8346b9f8dd2fd2800f61ad7114c07ae0fb37c00e17e9adde6350fd2053652e13b8a75ac6663dd58ad66795593d7603f527ff'
            '456084a08ce0e02a4a32d67a8a7937d45695cb4b08b29297ead8a7e9d2a92963335f653f56d4c9346f4b2729868408fafbcd4caebf9fc8cdaa90171514cf4a57')

prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --mandir=/usr/share/man/man1 --python=python2
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
    install -D -m 644 "$srcdir/tvheadend.service" "$pkgdir/usr/lib/systemd/system/tvheadend.service"
}
