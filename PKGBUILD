# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=sslscan-git
pkgver=376.6891c0d
pkgrel=1
pkgdesc="sslscan tests SSL/TLS enabled services to discover supported cipher suites"
arch=('i686' 'x86_64')
url="https://github.com/rbsec/sslscan"
license=('GPL3')
makedepends=('git' 'gcc' 'make')
conflicts=('sslscan')
source=("$pkgname"::'git://github.com/rbsec/sslscan.git')
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	make static
}

package() {
	cd "${srcdir}/${pkgname}"
        install -D -m755 sslscan "${pkgdir}/usr/bin/sslscan"
        install -D -m664 sslscan.1 "${pkgdir}/usr/share/man/man1/sslscan.1"
        install -D -m664 LICENSE "${pkgdir}/usr/share/licenses/sslscan/LICENSE"
}
