# Maintainer: articpenguin <julia.schweinz at mailfence dot com>
# Contributor: Julian <juliannfairfax@protonmail.com>

_pkgname=modernish
pkgname=modernish-git
pkgver=0.16.0.alpha.r1507.9b4a98a
pkgrel=2
pkgdesc="POSIX compliant shell script library for modern, robust, portable, readable shell code"
arch=(any)
url='https://github.com/modernish/modernish'
license=('ISC')
depends=(
 sed
 awk
)
makedepends=(
 git
)
provides=("$_pkgname")
conflicts=("${_pkgname%"-git"}")
source=("git+$url")
sha256sums=(SKIP)

pkgver() {
	cd "$_pkgname"
	printf "%s.r%s.%s" \
		"$(git describe --abbrev=0 --tags)" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)" \
		| sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

package() {
	cd "$_pkgname"

    install -d "$pkgdir/usr/bin"

	install -d "$pkgdir/opt/$_pkgname"

	./install.sh -n -s /bin/sh -d "$pkgdir/opt/$_pkgname"
	
	ln -s "/opt/modernish/bin/modernish" "$pkgdir/usr/bin/modernish"
	
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
