# Maintainer: Gurkirat Singh <tbhaxor@proton.me>

pkgname=bash-it
pkgver=3.0.3
pkgrel=4
pkgdesc='A community Bash framework.'
arch=('any')
url='https://bash-it.readthedocs.io/en/latest/'
license=('MIT')
source=(
	"https://github.com/Bash-it/bash-it/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
	'43ab0aa178685730771199bf8d67fd89131a3be4e49d3f16c4fdf1ac68644c79'
)
depends=(
	'bash'
)
install="${pkgname}.install"
conflicts=('bash-it-git')

prepare() {
	sed -i "s|{{BASH_IT}}|/opt/${pkgname}|g" "${srcdir}/${pkgname}-${pkgver}/template/bash_profile.template.bash"
}

package() {
    mkdir -p "$pkgdir/opt"	
	cp -rf "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/template/bash_profile.template.bash" "${pkgdir}/etc/profile.d/bashit.sh"
}
