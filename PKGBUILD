# Maintainer: Joshua Haase <hahj87@gmail.com>
pkgname=snap-dna-git
pkgver=v0.15.r199.ea6690f
pkgrel=1
pkgdesc="Scalable Nucleotide Alignment Program"
arch=('i686' 'x86_64' 'armv7h')
url="http://snap.cs.berkeley.edu/"
license=('apache')
groups=()
depends=('zlib' 'gcc-libs')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/amplab/snap")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	./unit_test
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -m 0755 -d "$pkgdir/usr/bin"
	install -m 0755 snap-aligner SNAPCommand "$pkgdir/usr/bin"
	install -m 0755 -d "$pkgdir/usr/lib/${pkgname%-git}"
	install -m 0755 unit_tests "$pkgdir/usr/lib/${pkgname%-git}"
	install -m 0755 -d "$pkgdir/usr/share/licenses/${pkgname}"
	install -m 0644 LICENSE COPYING "$pkgdir/usr/share/licenses/${pkgname}"
}
