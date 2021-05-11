# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Joaquín I. Aramendía <samsagax at gmail dot com>
pkgname=srt-live-server
pkgver=1.4.8
pkgrel=1
epoch=
pkgdesc="An open source live streaming server for low latency based on Secure Reliable Tranport(SRT)."
arch=('x86_64')
url="https://github.com/Edward-Wu/srt-live-server"
license=('MIT')
depends=('srt')
makedepends=('srt')
source=("https://github.com/Edward-Wu/srt-live-server/archive/refs/tags/V${pkgver}.tar.gz")
md5sums=('e03813b3d09ea91b23d96d033f7d1961')

build() {
	cd "$pkgname-$pkgver"
	#./configure --prefix=/usr
	CFLAGS="-Wno-error=format-security" make
}

package() {
	cd "$pkgname-$pkgver"
    mkdir -p ${pkgdir}/usr/bin
    install -Dm755 bin/* ${pkgdir}/usr/bin/

    mkdir -p ${pkgdir}/etc
    install -Dm644 sls.conf ${pkgdir}/etc/
}
