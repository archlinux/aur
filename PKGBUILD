# Maintainer: Moritz Lipp <mail@mlq.me>
pkgname=opmsg-git
pkgver=r131.ce12dc8
pkgrel=1
epoch=
pkgdesc="opmsg message encryption"
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/stealth/opmsg"
license=('GPL3')
depends=('openssl')
makedepends=('git')
source=("${pkgname}::git+git://github.com/stealth/opmsg.git")
md5sums=('SKIP')
conflicts=('opmsg')

pkgver() {
	cd "$pkgname"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}/src"
	make
	make contrib
}

package() {
	cd "${srcdir}/${pkgname}"
	mkdir -p "$pkgdir/usr/share/$pkgname"
	install -D -m644 sample.config "$pkgdir/usr/share/$pkgname"
        cd "${srcdir}/${pkgname}/src"
	install -D -m755 opmsg "$pkgdir/usr/bin/opmsg"
	install -D -m755 opmux "$pkgdir/usr/bin/opmux"
	install -D -m755 opcoin "$pkgdir/usr/bin/opcoin"
}
