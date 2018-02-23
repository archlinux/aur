# Maintainer: robertfoster

pkgname=ibm-sw-tpm2
pkgver=1119
pkgrel=1
pkgdesc="An implementation of the TCG TPM 2.0 specification by IBM"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/ibmswtpm2/"
license=('BSD')
depends=('openssl-1.0')
source=("https://downloads.sourceforge.net/project/ibmswtpm2/ibmtpm$pkgver.tar.gz"
	makefile
	tpm2_server
tpm2_server.service)

build() {
	cd $srcdir
	cp makefile src/
	cd src
	make -f makefile
}

package() {
	cd $srcdir/
	install -Dm755 src/tpm_server $pkgdir/usr/bin/tpm_server
	install -Dm755 tpm2_server $pkgdir/usr/bin/tpm2_server
	install -Dm755 tpm2_server.service $pkgdir/usr/lib/systemd/system/tpm2_server.service
}

md5sums=('cf20b9080b4692984c8389c5052fe68a'
	'67f313d49a98a4b75371bc9679f880e6'
	'3bff9d0e8b2b7b68be2e388d8ca4e2ce'
'e64a1c4908f3eea859b25cf291e7848a')
