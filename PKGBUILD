# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=taskbook-sh
_pkgname=taskbook
_appname=tb
pkgbase=${_pkgname}-bin
pkgname=(${_pkgname}-bin ${_pkgname}-server-bin)
pkgdesc="Tasks, boards & notes for the command-line habitat"

pkgver=1.3.2
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
sha256sums=('ea9cd32fc0c7e49e550d54fd2f225b71a61ec2260c3e0631cc595a665c3bdd19'
            '6ab99a27e8459947fe3f594861c9eb12f9e3360725d2327be5d65dcc3f85264c'
            '0e34e5eb9b602a98ba132e1e538086085dd5681c3dbcc30754b495d4879bcdee'
            'd24ddcad0e18f17dae1a970452e5ca2e955e86a15f0f0960ca1fffa3794ac334'
            'f3b6d0020bb98d66e2a41b9e2b8eb3edfd650850e2136c58aec4662cb080121a'
            '35b6a243a1cd7605843a88bdfc95df4d65915b79797015ede542d373995e5e68'
            'b316e800f1ff5cf46477e6464c7749b214c03dadc85571c6758e4fa6584c6708')
sha256sums_x86_64=('bada9e8b489e51ff7d329fdf2d35097d01b78e3ed5953a366620da9d73d43838'
                   '9e760e97d7c42acf5d8c6e459b49d4e72bae7f9a925edf73a94b3499cd030f0e')
sha256sums_aarch64=('c3ff56cd7d9871c90af23b21394da858a88e02b40efbedf81dbcccd9a15e7fe2'
                    '21bf8352b856e3967cd8964a7854d6d7fa6fb2ba5dd355ef2d6befef1be9b680')


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
