# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=copilot
_pkgauthor=github
_pkgname=${_appname}-cli
pkgname=${_pkgauthor}-${_pkgname}-bin
pkgdesc="GitHub Copilot CLI brings the power of Copilot coding agent directly to your terminal."

pkgver=1.0.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=("LicenseRef-GitHub")

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
sha256sums_x86_64=('521f87d04f073356c65ad973db7124b32ff3a23fd3257f0cd3fcf4c5d4649047')
sha256sums_aarch64=('a0325b2f2646d5b7e461ad09a366415a858476d6f3d1590c613ff63957aa5465')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
