# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor: L0-FF

pkgname=dnswalk
pkgver=2.0.2
pkgrel=4
pkgdesc="A DNS debugger"
url="http://sourceforge.net/projects/dnswalk/"
license=('GPL')
arch=(i686 x86_64)
depends=('perl-net-dns')
source=("https://sourceforge.net/projects/dnswalk/files/$pkgname/$pkgver/dnswalk-$pkgver.tar.gz/download"
	'dnswalk.patch'
	'makereports.patch'
	'0001-Incorporated-PR-from-vanmelick-to-fix-SOA-and-define.patch'
)
sha256sums=('b49ea147a00e95e80330534d43f8737c2367ae862050e9a8009a607c49f0ea6b'
            '57468e00d5beffd89f0982d92195b3e01b977690a4a178a7b45462f9f335db7c'
            '7e6f82d474872234ae2c7e7fca9328fa7a8bad285f5bff3886a1226258070de9'
            '563240cb0aca1b81d80fddf7ec51c8f1e05dd7eca2d3baa93f22e4cf93d32366')

prepare() {
	cd $srcdir
	patch dnswalk dnswalk.patch
	patch dnswalk 0001-Incorporated-PR-from-vanmelick-to-fix-SOA-and-define.patch
	patch makereports makereports.patch
}

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/bin
	cp {do-,}dnswalk $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/doc/dnswalk
	cp {CHANGES,README,TODO,rfc1912.txt,makereports,sendreports,dnswalk.errors} $pkgdir/usr/share/doc/dnswalk/
	mkdir -p $pkgdir/usr/man/man1
	cp dnswalk.1 $pkgdir/usr/man/man1/
}
