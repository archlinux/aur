# Maintainer: Arda Demir <ddmirarda@gmail.com>
pkgname=reqrypt-client-git
pkgver=r80.98bc77d
pkgrel=1
pkgdesc="ReQrypt is a tool for tunneling and encrypting web browser requests to hide them from local snooping and interception."
arch=('i686' 'x86_64')
url="https://reqrypt.org/reqrypt.html"
license=('GPL')
makedepends=('git' 'gcc' 'autoconf')
source=("$pkgname"::"git+https://github.com/basil00/reqrypt.git#branch=master")
md5sums=('SKIP')

build() {
        cd "$srcdir/$pkgname"
	autoconf
        ./configure
        make client
}

package() {
	cd "$srcdir/$pkgname"

        install -Dm755 "src/reqrypt" "$pkgdir/usr/bin/reqrypt"
	
	sed -i 's#/usr/sbin/reqrypt#/usr/bin/reqrypt#g' "src/tools/reqrypt.service"
	install -Dm644 "src/tools/reqrypt.service" "$pkgdir/usr/lib/systemd/system/reqrypt.service"
}
