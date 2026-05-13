# Maintainer: yuhldr yuhldr@qq.com

_pkgname="ikuuu_vpn"
_binname="ikuuu-vpn"
pkgname="${_binname}"
pkgver="0.14.4"
_buildid="5dfad582"
pkgrel=1
pkgdesc="iKuuuVPN (repacked from .deb)"
arch=('x86_64')
url="https://ikuuu.dev/"
license=('custom')
options=(!strip !debug)
depends=('gtk3')
provides=("${_pkgname}" "${_binname}")
conflicts=("${_pkgname}" "${_binname}")

_deb_file="${_pkgname}-${pkgver}-${_buildid}-linux-amd64.deb"

source=("${_deb_file}::https://1858587525.v.123pan.cn/1858587525/client/${_pkgname}-${pkgver}-${_buildid}/${_deb_file}")
sha256sums=('a2c0cece4b85d6181fdac360d640358169257cf4cc1bedd5d02e8b6bbf5c2972')

prepare() {
	bsdtar -xf "${_deb_file}"
}

build() {
	:
}

package() {
	bsdtar --no-same-owner --no-same-permissions -xf data.tar.xz -C "${pkgdir}"

	# Desktop file: use a stable command name
	sed -i \
		-e "s|^Exec=.*|Exec=${_binname} %U|" \
		"${pkgdir}/usr/share/applications/iKuuuVPN.desktop"

	# Binaries (provide both iKuuuVPN, ikuuu_vpn and ikuuu-vpn)
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "../share/iKuuuVPN/iKuuuVPN" "${pkgdir}/usr/bin/iKuuuVPN"
	ln -s "iKuuuVPN" "${pkgdir}/usr/bin/${_pkgname}"
	ln -s "iKuuuVPN" "${pkgdir}/usr/bin/${_binname}"
}
