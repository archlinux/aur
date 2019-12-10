# Original Maintainer: Jonatan Bravo <zephrax@gmail.com>
# Maintainer: Hendrik "T4cC0re" Meyer <aur@t4cc0.re>
pkgname=tfenv
pkgver=1.0.2
pkgrel=5
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
provides=("tfenv" "terraform")
source=("https://github.com/tfutils/tfenv/archive/v${pkgver}.tar.gz")
validpgpkeys=()
install="${pkgname}.install"

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/var/lib/tfenv/libexec"
	echo $srcdir
	ls -lah
	sed -i 's:TFENV_ROOT="$(cd "$(dirname "$(readlink_f "${0}")")/.." \&\& pwd)":TFENV_ROOT="$(cd "$(dirname "$(readlink_f "${0}")")/../../var/lib/tfenv" \&\& pwd)":' bin/tfenv
	install -m755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -m755 "bin/terraform" "${pkgdir}/usr/bin/terraform"
	for i in `ls ${srcdir}/${pkgname}-${pkgver}/libexec/`; do
		install -m755 "${srcdir}/${pkgname}-${pkgver}/libexec/$i" "${pkgdir}/var/lib/tfenv/libexec/$i"
	done
	chmod +x "${pkgdir}/usr/bin/${pkgname}"

	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}

sha512sums=(f4fa3b9176ba7dcba49542debd6c3102d722122ae1f66d99a50bb422a1ecbb55c9639ef774225212c74125a7ea6c6f65f9ff0d66dd4835a2c91cadbf29ad2074)
