# Maintainer: Katie Wolfe <wolfe@katie.host>
pkgname=udprelay
pkgver=1.0.0
pkgrel=2
pkgdesc=""
arch=('any')
url='https://git.sr.ht/~kt/udprelay'
license=('Unlicense')
depends=()
makedepends=('make' 'scdoc' 'go' 'git') # git required by Makefile. fixed in next version
source=("${pkgname}-v${pkgver}.tar.gz::https://git.sr.ht/~kt/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('af5aaa92f9d4f315624f8e3851c9b3a23060cab977155736061b4150b5d5cf07bf04eae384c76fdfaba466cfe90ede5eeb3e8c9ca57ccfda0e9f9aa25523bf58')

build() {
	export GOPATH="${srcdir}/go"
	cd "${pkgname}-v${pkgver}"
	go get -v .
	make udprelay docs
}

package() {
	cd "${pkgname}-v${pkgver}"
	install -Dm755 udprelay "${pkgdir}/usr/bin/udprelay"
	install -Dm644 udprelay.1 "${pkgdir}/usr/share/man/man1/udprelay.1"
	install -Dm644 udprelay.7 "${pkgdir}/usr/share/man/man7/udprelay.7"
}
