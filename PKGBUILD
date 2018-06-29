# Maintainer: Yiyao Yu <yuydevel at protonmail dot com>

_pkgname='kcptun-plugin'
pkgname="${_pkgname}-git"
pkgver=r23.761add6
pkgrel=1
pkgdesc='SIP003-compatible KCPTUN and UDP2RAW plugins for shadowsocks-libev'
license=('custom:Unlicense')
url='https://github.com/w1ndy/kcptun-plugins'
arch=('x86_64')
depends=('glibc' 'curl')
makedepends=('git' 'make')
source=("${_pkgname}::git+${url}.git"
		"${_pkgname}.install"
		)
install="${_pkgname}.install"
sha256sums=('SKIP'
			'SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -dm 755 "${pkgdir}/usr/local/kcptun_plugins" "${pkgdir}/usr/bin"
	install -Dm 755 'ss-proxy' 'kcptun-client-plugin' 'kcptun-server-plugin' 'lib' "${pkgdir}/usr/local/kcptun_plugins/"
	ln -s '/usr/local/kcptun_plugins/ss-proxy' "${pkgdir}/usr/bin/ss-proxy"
	ln -s '/usr/local/kcptun_plugins/kcptun-client-plugin' "${pkgdir}/usr/bin/kcptun-client-plugin"
	ln -s '/usr/local/kcptun_plugins/kcptun-server-plugin' "${pkgdir}/usr/bin/kcptun-server-plugin"

	install -Dm 644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
