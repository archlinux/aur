# Maintainer: Knut Ahlers <knut at ahlers dot me>
# Contributor: Siôn le Roux <sinisterstuf@gmail.com>

pkgname=reg
pkgver=0.16.1
pkgrel=1
pkgdesc="Docker registry v2 command line client and repo listing generator with security checks"
arch=('i686' 'x86_64')
url="https://github.com/genuinetools/$pkgname"
license=('MIT')
makedepends=(
	'go'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('2be68b405bb384d8eb3ae17a9b1c802a7f3212865ce61cf72f01794b9456787b1ef0eb62a538735d119153b0f472e741a8bbe99f1ce70d3b16ce1b8ba90eb4b8')

build() {
	mkdir -p "${srcdir}/go/src/github.com/genuinetools"
	ln -sf "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/go/src/github.com/genuinetools/${pkgname}"
	cd "${srcdir}/go/src/github.com/genuinetools/${pkgname}"
	GOPATH="${srcdir}/go" make install
}

package() {
	install -Dm755 "${srcdir}/go/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
