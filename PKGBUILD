# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Co-maintainer: edu4rdshl <edu4rdshl at protonmail dot com>

_appname=copilot
_pkgname=${_appname}-cli
_barch=('linux-x64' 'linux-arm64')
pkgname=github-${_pkgname}-bin
pkgdesc="GitHub Copilot CLI brings the power of Copilot coding agent directly to your terminal."

pkgver=1.0.8
pkgrel=1

arch=('x86_64' 'aarch64')

license=("LicenseRef-GitHub-Copilot")

url="https://github.com/github/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/github/${_pkgname}/v${pkgver}"

provides=("${_appname}")
conflicts=("${pkgname%%-bin}" "${pkgname%%-cli-bin}")
depends=('glibc' 'libgcc' 'nodejs' 'glib2' 'libsecret')

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"CHANGELOG-${pkgver}.md::${_urlraw}/changelog.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('33657f2e7383f2167b47d5f8c549a6071905a5c93d5d67d17e5c5399f126f07b'
            '9f04e765a0e646b52a8a8c96d6388948047e203086cb0eb4acfeb3ce7df1a175'
            '1fbd0dcc55c66738b1b591632132c927de20c8443dff1d55b4851e378883e402')
sha256sums_x86_64=('948aa3b282f42387c759fbed6d8485e12cd3300ce561473b48af988b8e5306b3')
sha256sums_aarch64=('ceaf83d8a0d988c1fccde31edd763d2fe5cf921cbe7a6aeb4de4ac9740ef1b52')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

