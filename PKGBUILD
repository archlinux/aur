# Contributor: Max Resch <mxr@users.sourceforge.net>
# Thanks To: audrencezar
pkgname=bing
pkgver=1.1.3
pkgrel=4
pkgdesc="Measure the bandwidth between two hosts using the ICMP protocol without the need of a client/server architecture"
arch=('i686' 'x86_64')
url="http://fgouget.free.fr/bing/bing_src-readme-1st.shtml"
license=('BSD')
depends=('glibc')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz"
	"https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}-2.diff.gz")
sha256sums=('318865a38aac472e03ba44dd34ba2bf0c535f46187a22a3075be466b293e55c3'
	'103e0912088150ac89c2690e1f6faca9deb2787b7057aa87cf28cc7412333c49')
build() {
	cd $srcdir/$pkgname-$pkgver
	patch -p1 -i ${srcdir}/${pkgname}_${pkgver}-2.diff
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -D -o root -g root -m 4555 bing $pkgdir/usr/bin/bing || return 1
	install -D -o root -g root -m 0644 unix/bing.8 $pkgdir/usr/share/man/man8/bing.8 || return 1
}

