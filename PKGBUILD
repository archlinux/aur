# Maintainer: xiretza <xiretza+aur@gmail.com>
pkgname=factorio-init
pkgver=2.5.0
pkgrel=1
pkgdesc="A simple factorio init script for linux"
arch=('any')
url="https://github.com/Bisa/factorio-init"
license=('MIT')
depends=('bash'
	 'factorio-headless')
backup=("etc/conf.d/factorio-init")
source=("https://github.com/Bisa/factorio-init/archive/${pkgver}.tar.gz"
	"factorio-init.service"
	"factorio-init.conf")
sha256sums=('a1d90b5b1804a932e258ccf43dfd7cd7ffcd44ae8b83d87203187f0469d17789'
            '876eba92ba84dfc473fa23915525c4123cebfec474151704c515aae18ae81dfb'
            '0dd4fd75cf3448451a1b55bdf6bc38a4b9654a8d125cac391b180f70732a62e0')

package() {
	cd "${srcdir}"

	install -Dm644 factorio-init.service -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 factorio-init.conf "${pkgdir}/etc/conf.d/factorio-init"

	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/factorio-init/"

	_pkgdir="${pkgdir}/usr/share/${pkgname}/"
	install -Dm644 bash_autocomplete -t "${_pkgdir}"
	install -D factorio "${_pkgdir}/factorio-init"

	install -d "${pkgdir}/usr/share/bash-completion/completions/"
	install -d "${pkgdir}/usr/bin/"

	ln -s "/usr/share/${pkgname}/bash_autocomplete" "${pkgdir}/usr/share/bash-completion/completions/factorio-init"
	ln -s "/usr/share/${pkgname}/factorio-init" "${pkgdir}/usr/bin/factorio-init"
	ln -s "/etc/conf.d/factorio-init" "${_pkgdir}/config"

}
