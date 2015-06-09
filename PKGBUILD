# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=ntdsxtract
pkgver=1.3.1
pkgrel=1
pkgdesc="A framework for offline forensic analysis of NTDS.DIT"
arch=('i686' 'x86_64')
url="http://www.ntdsxtract.com/"
license=('GPL2')
depends=('python2' 'python2-crypto' 'libesedb')
source=($pkgname-$pkgver.zip::http://www.ntdsxtract.com/downloads/ntdsxtract/ntdsxtract_v1_3_1_beta.zip)
md5sums=('0057e137ced55a2e16b9c5d681f6f8ee')

prepare() {
	cd "$srcdir"
	sed -i '1s/^/#!\/usr\/bin\/python2\n/' *.py
}

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir"/usr/lib/python2.7/site-packages
	cp -ar {ntds,framework} "$pkgdir"/usr/lib/python2.7/site-packages
	for f in *.py; do
	    install -Dm755 "$f" "$pkgdir"/usr/bin/${f%.py}
	done
}
