# Maintainer: MkFly <mmkfly@gmail.com>
# Contributor: Igor Nemilentsev <trezorg@gmail.com>

pkgname=httpsqs
pkgver=1.7
pkgrel=1
pkgdesc='HTTP Simple Queue Service, message queue based on HTTP GET/POST protocol.'
arch=('i686' 'x64')
url='http://code.google.com/p/httpsqs'
license=('BSD')
depends=('libevent' 'tokyocabinet')
source=(http://httpsqs.googlecode.com/files/httpsqs-1.7.tar.gz httpsqs)
md5sums=('2e5a71a5ed04c30efeab9939ca39a786'
	'66f5a727b0b1d7ddb44541a17953c58f'
)

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make || return 1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	mkdir -p ${pkgdir}/usr/bin || return 1
	mkdir -p ${pkgdir}/etc/rc.d || return 1
	cp -v ${srcdir}/httpsqs ${pkgdir}/etc/rc.d/httpsqs
	make DESTDIR=${pkgdir} install || return 1
}