# Maintainer: kriskras99 <admin at kriskras99 dot nl>
# Contributor: misson20000 <xenotoad at xenotoad dot n e t>
pkgname=hactool-git
pkgver=1.4.0.r13.g1d64a83
pkgrel=1
pkgdesc="hactool is a tool to view information about, decrypt, and extract common file formats for the Nintendo Switch, especially Nintendo Content Archives."
arch=("any")
url="https://github.com/SciresM/hactool"
license=("ISC")
groups=("base-devel")
depends=("glibc")
makedepends=("git")
conflicts=("hactool")
arch=("x86_64")
provides=("hactool")
source=("git+https://github.com/SciresM/hactool.git")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/hactool"
	git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/hactool"
	cp config.mk.template config.mk
	make
}

package() {
	install -D -t "$pkgdir/usr/bin" "$srcdir/hactool/hactool"
	install -Dm644 "$srcdir/hactool/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
