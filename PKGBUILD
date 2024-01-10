# Original Maintainer: Vitalie Mudrenco <xvitcoder at gmail.com>

pkgname=pkenv
pkgver=0.5.3
pkgrel=2
epoch=
pkgdesc="Packer version manager inspired by tfenv"
arch=("any")
url="https://github.com/iamhsa/pkenv"
license=('MIT')
groups=()
depends=(bash unzip)
makedepends=()
checkdepends=()
optdepends=()
provides=("pkenv" "packer")
source=("https://github.com/iamhsa/pkenv/archive/${pkgver}.tar.gz")
validpgpkeys=()
install="${pkgname}.install"
conflicts=("packer")

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/opt/pkenv/libexec"
	mkdir -p "${pkgdir}/opt/pkenv/bin"

	ln -s "/opt/pkenv/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	ln -s "/opt/pkenv/bin/packer" "${pkgdir}/usr/bin/packer"

	install -m755 "bin/${pkgname}" "${pkgdir}/opt/pkenv/bin/${pkgname}"
	install -m755 "bin/packer" "${pkgdir}/opt/pkenv/bin/packer"

	for i in "${srcdir}/${pkgname}-${pkgver}/libexec/"*; do
		install -m555 "$i" "${pkgdir}/opt/pkenv/libexec/$(basename "$i")"
	done

	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}

sha512sums=(fc35d5eff70695a7be51abfb7b76baa0a5fdf6989cf783d73c5b2449facd50ec468569b09c43917300f16a3b69648d2e6399d1c736a32c79f9cc23458c7b1574)
