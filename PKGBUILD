# Maintainer: Josip Janzic <me@josip.dev>

pkgname=mimedown-git
pkgver=r33.771f453
pkgrel=1
pkgdesc="Markdown to multipart MIME"
arch=('i686' 'x86_64')
url="https://github.com/begriffs/mimedown"
license=('ISC')
makedepends=('cmark')
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	(
	 set -o pipefail
	 git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	install -Dm755 md2mime $pkgdir/usr/bin/md2mime
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
