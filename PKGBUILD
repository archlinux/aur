# Maintainer: chr0mag <phillips.julian AT gmail DOT com>
pkgname=sos
pkgver=3.6
pkgrel=2
epoch=
pkgdesc="A unified tool for collecting system logs and other debug information"
arch=('any')
url="https://github.com/sosreport/sos"
license=('GPL2')
groups=()
depends=('python'
	 'python-six'
	 'python-lxml')
makedepends=('python-sphinx') 
checkdepends=('python-nose'
	      'python-coverage')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/sos.conf')
options=()
install=
changelog=
_archpullreq="1198.patch"
source=("https://github.com/sosreport/sos/archive/$pkgver.tar.gz"
	"https://patch-diff.githubusercontent.com/raw/sosreport/sos/pull/$_archpullreq")

noextract=()
md5sums=()
sha256sums=('0e19b80e307140a3af78adb2fe5b821ab3c8fc6fb63d3851c78ef83de2680fd3'
            '10478856a9edd42a32d52c1af1b65c86532aed8c0f5b892ce531fb8d3cb41759')

validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch --strip=1 < ../$_archpullreq
}

build() {
	cd "$pkgname-$pkgver"
	make build
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	#put binary in /usr/bin instead of /usr/sbin
	mkdir ${pkgdir}/usr/bin
	mv ${pkgdir}/usr/sbin/sosreport ${pkgdir}/usr/bin
	rmdir ${pkgdir}/usr/sbin 
	#rmdir ${pkgdir}/usr/share/doc/sos  ${pkgdir}/usr/share/sos/extras
}
