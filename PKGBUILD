# Maintainer: Julien Virey <julien.virey+aur@gmail.com>
# maintainer: dialuplama <dialuplama@teknik.io>
# co-maintainer: muhas <muhas@mail.ru>

pkgname=dsh
pkgver=0.25.10
pkgrel=2
pkgdesc="Distributed shell (or dancer’s shell) executes command remotely on several different machines at the same time."
arch=('x86_64')
url="http://www.netfort.gr.jp/~dancer/software/dsh.html"
license=('GPL-2.0-or-later')
depends=('libdshconfig')
source=(
	"https://www.netfort.gr.jp/~dancer/software/downloads/$pkgname-$pkgver.tar.gz"
	test.patch
)
sha256sums=('520031a5474c25c6b3f9a0840e06a4fea4750734043ab06342522f533fa5b4d0'
            '2739f4ddd223c863a065d71aeb197a34e6ec4095e9001396ca1f19afb4eb7d9c')

prepare() {
 cd "$pkgname-$pkgver"
 patch -p1 < ../test.patch
}

build() {
	cd "$pkgname-$pkgver"
	./configure \
        --prefix=/usr \
        --sysconfdir="/etc/$pkgname"
	make
}

check() {
	cd "$pkgname-$pkgver"
	# We don't want to use $HOME/.dsh/dsh.conf for the test
	unset HOME
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
