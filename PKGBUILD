# Original Maintainer: Jonatan Bravo <zephrax@gmail.com>
# Maintainer: Hendrik "T4cC0re" Meyer <aur@t4cc0.re>
pkgname=tfenv
pkgver=1.0.2
pkgrel=4
epoch=
pkgdesc="Terraform version manager inspired by rbenv"
arch=("x86_64")
url="https://github.com/tfutils/tfenv"
license=('MIT')
groups=()
depends=("unzip")
makedepends=()
checkdepends=()
optdepends=()
provides=("tfenv")
source=("https://github.com/tfutils/tfenv/archive/v${pkgver}.tar.gz")
validpgpkeys=()

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/local/bin"
	mkdir -p "${pkgdir}/usr/local/lib/tfenv/libexec"
	echo $srcdir
	ls -lah
	sed -i 's:TFENV_ROOT="$(cd "$(dirname "$(readlink_f "${0}")")/.." \&\& pwd)":TFENV_ROOT="$(cd "$(dirname "$(readlink_f "${0}")")/../lib/tfenv" \&\& pwd)":' bin/tfenv
	install -m755 "bin/${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
	install -m755 "bin/terraform" "${pkgdir}/usr/local/bin/terraform"
	for i in `ls ${srcdir}/${pkgname}-${pkgver}/libexec/`; do
		install -m755 "${srcdir}/${pkgname}-${pkgver}/libexec/$i" "${pkgdir}/usr/local/lib/tfenv/libexec/$i"
	done
	chmod +x ${pkgdir}/usr/local/bin/${pkgname}
	install -m644 "${srcdir}/${pkgname}-${pkgver}/CHANGELOG.md" "${pkgdir}/usr/local/lib/tfenv/"
}
sha512sums=(f4fa3b9176ba7dcba49542debd6c3102d722122ae1f66d99a50bb422a1ecbb55c9639ef774225212c74125a7ea6c6f65f9ff0d66dd4835a2c91cadbf29ad2074)
