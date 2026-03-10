# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=copilot
_pkgauthor=github
_pkgname=${_appname}-cli
pkgname=${_pkgauthor}-${_pkgname}-bin
pkgdesc="GitHub Copilot CLI brings the power of Copilot coding agent directly to your terminal."

pkgver=1.0.3
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=("LicenseRef-GitHub")

changelog="changelog.md"

provides=("${_appname}")
conflicts=("${pkgname%%-bin}" "${pkgname%%-cli-bin}")

depends=('glibc' 'libgcc' 'nodejs' 'glib2' 'libsecret')

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('33657f2e7383f2167b47d5f8c549a6071905a5c93d5d67d17e5c5399f126f07b'
            '1fbd0dcc55c66738b1b591632132c927de20c8443dff1d55b4851e378883e402')
sha256sums_x86_64=('cf0e569594fda7d476c654e38a34bc95771349e7b6d7905d592bb4db24da7440')
sha256sums_aarch64=('2eb1851b501fdacf0e7cf0672c9a96ec704b754c31bc55983a033eeaaceb4aff')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
