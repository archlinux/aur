# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=starknet-foundry
pkgname=${_pkgname}-bin
_orgname=foundry-rs
_github=${_orgname}/${_pkgname}
pkgver=0.51.0
pkgrel=1
pkgdesc='Blazing fast toolkit for developing Starknet contracts'
arch=('x86_64' 'aarch64')
url="https://github.com/${_github}"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=('scarb'
		'universal-sierra-compiler')
# also requires rust, but it is not a package
source_x86_64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e97b6c14dad08ed4f16a7100016120b72a0b79be8fbb27b802ab3edadcb91d04')
sha256sums_aarch64=('1383338ce32abb2e2231b79aaceab01c0cdb92db667a652c8232cc48e1f62c16')

package() {
	for each_executable in $(ls "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu/bin"); do
		install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu/bin/${each_executable}" "${pkgdir}/usr/bin/${each_executable}"
	done
	install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-${arch}-unknown-linux-gnu/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
