# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=taskbook-sh
_pkgname=taskbook
_appname=tb
pkgbase=${_pkgname}-bin
pkgname=(${_pkgname}-bin ${_pkgname}-server-bin)
pkgdesc="Tasks, boards & notes for the command-line habitat"

pkgver=1.5.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"QUICK_START-${pkgver}.md::${_urlraw}/docs/README.md"
		"CLI_REFERENCE-${pkgver}.md::${_urlraw}/docs/cli-reference.md"
		"CONFIGURATION-${pkgver}.md::${_urlraw}/docs/configuration.md"
		"SERVER-${pkgver}.md::${_urlraw}/docs/server.md"
		"SYNC-${pkgver}.md::${_urlraw}/docs/sync.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}.tar.gz"
			   "${_pkgname}-server-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-server-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}.tar.gz"
				"${_pkgname}-server-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-server-${_barch[1]}.tar.gz")
sha256sums=('e49b81d6927bf77baea7a0e938a04f3992082973d83326cd7f22d4ee9880b800'
            'c455ce183dcb1a34d4b899943a71972693ff730f4ccb8cd00f092a20eab67840'
            '0e34e5eb9b602a98ba132e1e538086085dd5681c3dbcc30754b495d4879bcdee'
            'cd7b5c186b362b66f8811b84c3758c398845c4736cb558dd7fe504c694bd0bfc'
            'd1c038eac716e6909c28063b6042dc1152408d937cf68fc2f836e524cebacc0a'
            '2045fddabe0a90c3ed2bd6c34e4b02376a579ed4aa8cad204a2a3ee7308c264a'
            'b316e800f1ff5cf46477e6464c7749b214c03dadc85571c6758e4fa6584c6708')
sha256sums_x86_64=('0e4a56627272e70a8ca836367596acad46844680846edf4e1284f36d1ad3c241'
                   '654bf7178059f572108ba534d11681f5ad5021a6733cec66cf1835e197df4a36')
sha256sums_aarch64=('6bcb982eecccabb4434a6af5ae53a5fd8cb59c055311508c3ec631d4a14d6ee2'
                    '28e59c1ee6570676f38ada303d86d79fd52e56ed96c0b7c94ef50aa4534c3e90')


package_taskbook-bin() {
	pkgdesc+=" (Client)"

	provides+=("${_appname}")
	conflicts=("${_pkgname}")

	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "QUICK_START-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/QUICK_START.md"
	install -Dm644 "CLI_REFERENCE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CLI_REFERENCE.md"
	install -Dm644 "CONFIGURATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONFIGURATION.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_taskbook-server-bin() {
	pkgdesc+=" (Server)"

	provides+=("${_appname}-server")
	conflicts=("${_pkgname}-server")

	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-server" "${pkgdir}/usr/bin/${_appname}-server"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "SERVER-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SERVER.md"
	install -Dm644 "SYNC-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SYNC.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
