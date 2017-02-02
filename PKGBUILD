# Contributor: Marius Orcsik <marius@habarnam.ro>
# Maintainer: Mark Crichton <crichton@gmail.com>

pkgname=hitch
pkgver=1.4.4
pkgrel=1
pkgdesc="Hitch is a libev-based high performance SSL/TLS proxy."
arch=('x86_64' 'i686' 'armv7h')
url="https://hitch-tls.org"
license=('BSD')
depends=('libev' 'openssl')
makedepends=('python-docutils')
conflicts=("$pkgname-git")

source=("$url/source/$pkgname-$pkgver.tar.gz"
        "hitch.service")

sha256sums=('5b4e8deeaafa6ae3998b24af035c8df9bd25e6527c4e1811645f53368da69eab'
            'd9f33cf412067a0dff74e4e9985c5d502ed83b29fcd261900779e14d97e99bac')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure \
        --prefix=/usr \
        --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	install -D -m0644 "${srcdir}/hitch.service" "${pkgdir}/usr/lib/systemd/system/hitch.service"
}
