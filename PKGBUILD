# Maintainer: Fermín Olaiz <ferminolaiz@gmail.com>

pkgname=hpsahba-git
pkgver=r41.0a57a52
pkgrel=3
pkgdesc="Tool to enable/disable HBA mode on some HP Smart Array controllers"
arch=('x86_64')
url="https://github.com/im-0/hpsahba"
license=('GPL-2.0')
depends=()
makedepends=(git pandoc)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git#branch=master")
sha256sums=(SKIP)

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	make
	gzip hpsahba.8
}

package() {
	cd "${srcdir}/${pkgname}"
	echo $pkgdir $srcdir
	install -D hpsahba -t "${pkgdir}/usr/bin/"
	install -D hpsahba.8.gz -t "${pkgdir}/usr/share/man/man8/"
}
