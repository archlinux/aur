# Maintainer: Jason Gauci <contact+jgmath2000@gmail.com>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>

_ghname='EternalTerminal'
_tarname='et'
pkgbase='eternalterminal'
pkgname=('eternalterminal-client' 'eternalterminal-server' 'eternalterminal')
pkgver='6.1.3'
pkgrel=1
arch=('x86_64')
depends=(
	'libutempter' 'libunwind' 'openssl'
)
makedepends=(
	'ninja' 'cmake' 'tar' 'curl' 'zip' 'unzip'
)
url='https://mistertea.github.io/EternalTerminal/'
license=('Apache')

source=(
		"https://github.com/MisterTea/${_ghname}/archive/${_tarname}-v${pkgver}.tar.gz"
)
sha256sums=(
		'5eb76a6667b7c8ba13b5cb089221e5fe237e5dde164956af8720ed11a9a38dcd'
)

prepare() {
	cd "${srcdir}/${_ghname}-${_tarname}-v${pkgver}"

	msg2 'Preparing directories'
	mkdir -p build
}

build() {
	cd "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build"

	msg2 'Running cmake'
	cmake ../

	msg2 "Building ${_ghname}"
	make
}

package_eternalterminal-client() {
	pkgdesc='Re-Connectable Terminal connection. Includes only the client.'
	conflicts=('eternalterminal' 'eternalterminal-server')

	cd "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build"

	msg2 "Installing ${_ghname} client to package root"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/et" "${pkgdir}/usr/bin/et"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/et" "${pkgdir}/usr/bin/htm"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/et" "${pkgdir}/usr/bin/htmd"
}

package_eternalterminal-server() {
	pkgdesc='Re-Connectable Terminal connection. Includes only the server.'
	conflicts=('eternalterminal' 'eternalterminal-client')

	cd "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build"

	msg2 "Installing ${_ghname} server to package root"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/etserver" "${pkgdir}/usr/bin/etserver"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/etterminal" "${pkgdir}/usr/bin/etterminal"
	install -D -m 0644 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/systemctl/et.service" "${pkgdir}/usr/lib/systemd/system/et.service"
	install -D -m 0644 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/etc/et.cfg" "${pkgdir}/etc/et.cfg"
}

package_eternalterminal() {
	pkgdesc='Re-Connectable Terminal connection. Includes both client and server.'
	conflicts=('eternalterminal-client' 'eternalterminal-server')

	cd "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build"

	msg2 "Installing ${_ghname} to package root"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/et" "${pkgdir}/usr/bin/et"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/et" "${pkgdir}/usr/bin/htm"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/et" "${pkgdir}/usr/bin/htmd"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/etserver" "${pkgdir}/usr/bin/etserver"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/etterminal" "${pkgdir}/usr/bin/etterminal"
	install -D -m 0644 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/systemctl/et.service" "${pkgdir}/usr/lib/systemd/system/et.service"
	install -D -m 0644 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/etc/et.cfg" "${pkgdir}/etc/et.cfg"
}
