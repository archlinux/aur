# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Paul Mattal <pjmattal@elys.com>

pkgname=smtpprox
pkgver=1.2
pkgrel=7
pkgdesc='Simple efficient SMTP proxy in perl'
url='http://bent.latency.net/smtpprox/'
arch=('any')
license=('GPL')
depends=('perl')
source=("http://bent.latency.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
	'smtpprox-tmpname-and-xforward.patch'
	'smtpprox.service')
sha256sums=('5c993a63fd5aa9e4580f023f6435f44c47e38823e6cd66435b3dedc206cc55fa'
            '913490c0a4d0dd23476d1c7059a49b9a059f0768b668faae81327159f78e277d'
            '6a3dc880118effcaaa982be48f25ffd5dbd75a5ac9c621611a2f047b0b3356fd')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# patch to add xforward and predictable tempfile support
	patch -Np1 -i ${srcdir}/smtpprox-tmpname-and-xforward.patch
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# install
	install -D -m0755 smtpprox ${pkgdir}/usr/bin/smtpprox
	install -D -m0644 MSDW/SMTP/Client.pm ${pkgdir}/usr/share/perl5/vendor_perl/MSDW/SMTP/Client.pm
	install -D -m0644 MSDW/SMTP/Server.pm ${pkgdir}/usr/share/perl5/vendor_perl/MSDW/SMTP/Server.pm

	install -D -m0644 ${srcdir}/smtpprox.service ${pkgdir}/usr/lib/systemd/system/smtpprox.service
}

