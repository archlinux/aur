# Maintainer: ajs124 < aur AT ajs124 DOT de >

pkgname=rpimonitor
pkgdesc="A self monitoring application designed to run on Raspberry Pi"
arch=(any)
license=('GPL')
pkgver=2.10
pkgrel=1
depends=(rrdtool perl-http-daemon perl-json perl-ipc-sharelite perl-file-which)
url=(https://github.com/XavierBerger/RPi-Monitor)
source=($pkgname-$pkgver.tar.gz::https://github.com/XavierBerger/RPi-Monitor/archive/v${pkgver}.tar.gz)
sha512sums=('c18451018da65de81c5d3fd413c9d8f813fb32745f5b7481dabebba517f3f8eddde4e0813d6a3dfedbee299367ab5c6cc6bf06fe7a4530effd4c57e91f2f1f48')

package() {
	mkdir -p ${pkgdir}/{usr/{bin,lib/systemd/system,share/${pkgname}},etc/{conf.d,$pkgname},var/lib/$pkgname/web}/
	cd RPi-Monitor-${pkgver}/${pkgname}
	install -Dm755 ${pkgname}d ${pkgdir}/usr/bin/
	cp *.conf ${pkgdir}/etc/$pkgname/
	cp -r template ${pkgdir}/etc/$pkgname/
	cp ../tools/systemd/* ${pkgdir}/usr/lib/systemd/system/
	cp -r web ../scripts/ ${pkgdir}/usr/share/${pkgname}/
}
