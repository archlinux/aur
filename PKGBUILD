# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=taskbook-sh
_pkgname=taskbook
_appname=tb
pkgbase=${_pkgname}-bin
pkgname=(${_pkgname}-bin ${_pkgname}-server-bin)
pkgdesc="Tasks, boards & notes for the command-line habitat"

pkgver=1.3.1
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
sha256sums=('9262959a629c0ae2ceefbe5916d323e85dfe72ffe5907ee6e84a01de307fcf61'
            '6ab99a27e8459947fe3f594861c9eb12f9e3360725d2327be5d65dcc3f85264c'
            '0e34e5eb9b602a98ba132e1e538086085dd5681c3dbcc30754b495d4879bcdee'
            'd24ddcad0e18f17dae1a970452e5ca2e955e86a15f0f0960ca1fffa3794ac334'
            'eaca025a0b22c976b257bfbb9c5c3ba603169fe2ee2c77fcf08297a03f137890'
            '35b6a243a1cd7605843a88bdfc95df4d65915b79797015ede542d373995e5e68'
            'b316e800f1ff5cf46477e6464c7749b214c03dadc85571c6758e4fa6584c6708')
sha256sums_x86_64=('2f710e69bf4b261a2aeb726d5dad30771de03ebce7d2768eb4f7f27261d62275'
                   '1c9d0678bb915108ea25a437f56a2f52bd675516d6aa43761456680a89afe4bb')
sha256sums_aarch64=('c9532931813eef7adbe7da2cad52e8b176359841ca9247afca3fdc76f437f544'
                    '732fe2200d83de9c1be42c1c8247d2e518b0cfc28dabb0de71a1abbd106e9c83')


package_taskbook-bin() {
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
	provides+=("${_appname}-server")
	conflicts=("${_pkgname}-server")

	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-server" "${pkgdir}/usr/bin/${_appname}-server"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "SERVER-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SERVER.md"
	install -Dm644 "SYNC-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SYNC.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
