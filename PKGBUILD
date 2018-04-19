# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com > 

pkgname=duo-unix
pkgdesc='Duo 2FA Security'
pkgver=1.10.1
_pkgname=duo_unix-$pkgver
pkgrel=12
arch=('i686' 'x86_64')
url="https://duo.com/"
license=(GPL)
depends=('openssl' 'pam-selinux')
source=("https://dl.duosecurity.com/duo_unix-$pkgver.tar.gz")
sha256sums=('e2df2be50539c54c87cdc4964fdfee0fbd79a3f15fdfd807e94941291b5d6197')

build() {
	cd "$srcdir"/"$_pkgname"
	./configure --with-pam --prefix="/usr"
	make
}

package() {
	cd "$srcdir"/"$_pkgname"
	make install DESTDIR="$pkgdir"
	install -d "$pkgdir/usr/bin/"
	install -d "$pkgdir/usr/lib/"
	mv "$pkgdir/usr/sbin/login_duo" "$pkgdir/usr/bin/login_duo"
	mv "$pkgdir/lib64/security" "$pkgdir/usr/lib/"
	chmod u-s "$pkgdir/usr/bin/login_duo"
	rm -rf "${pkgdir}/usr/sbin"
	rm -rf "${pkgdir}/lib64"
}

