# Maintainer: Johannes Wienke <languitar@semipol.de>
pkgname=tgenv
pkgver=0.0.3
pkgrel=2
epoch=
pkgdesc="Terragrunt version manager inspired by tfenv"
arch=("x86_64")
url="https://github.com/cunymatthieu/tgenv"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("terragrunt")
source=("https://github.com/cunymatthieu/tgenv/archive/v${pkgver}.tar.gz")
sha512sums=('0e8cc9f360bd2efd84cec2f97eb79d290a64f8b1df57f4d9253bba77cc63dd0b06382c1c793c8e1093e25977e133eb49f5fa1f885a4a229ee701701bc4f29323')
validpgpkeys=()
conflicts=("terragrunt")
install="${pkgname}.install"

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/opt/tgenv/"

	# This patches tgenv to use a separate dir for versions and the default version
	sed -i 's:${TGENV_ROOT}/version:/var/lib/tgenv/version:g' libexec/tgenv-*

    cp -R "bin" "${pkgdir}/opt/tgenv/bin"
    cp -R "libexec" "${pkgdir}/opt/tgenv/libexec"
    cp "CHANGELOG.md" "${pkgdir}/opt/tgenv/CHANGELOG.md"

    ln -s "/opt/tgenv/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/opt/tgenv/bin/terragrunt" "${pkgdir}/usr/bin/terragrunt"
}
