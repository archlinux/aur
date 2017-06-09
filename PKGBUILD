# Maintainer: Filip <fila pruda com>
pkgname=milter-spamd
pkgver=0.7
pkgrel=1
pkgdesc="Sendmail milter that reject mail inline using SpamAssassin spamd."
arch=('x86_64' 'i686')
url="https://www.benzedrine.ch/milter-spamd.html"
license=('BSD')
depends=('spamassassin')
makedepends=('libmilter')


install=milter-spamd.install

source=("https://www.benzedrine.ch/${pkgname}-${pkgver}.tar.gz" "milter-spamd.service")

sha256sums=('04e252054e1ad61be76c455357e07c72b139a35ce310aa82ad24aae795e9ae4a' '8214094704464d6cc15f9365b48f60c79b5c450f25d45c25585f41b308a27827')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make -f Makefile.linux
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	#make DESTDIR="${pkgdir}/" install
	
	install -Dm0755 "milter-spamd" "${pkgdir}/usr/bin/milter-spamd"
	install -Dm0644 "milter-spamd.8" "${pkgdir}/usr/share/man/man8/milter-spamd.8"
	
	install -Dm644 "${srcdir}/milter-spamd.service" "${pkgdir}/usr/lib/systemd/system/milter-spamd.service"
	
}
