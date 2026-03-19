# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Co-maintainer: edu4rdshl <edu4rdshl at protonmail dot com>

_appname=copilot
_pkgname=${_appname}-cli
_barch=('linux-x64' 'linux-arm64')
pkgname=github-${_pkgname}-bin
pkgdesc="GitHub Copilot CLI brings the power of Copilot coding agent directly to your terminal."

pkgver=1.0.9
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
            '0f6fffd7296d09a9db04e9ef1a75b6d5a8e0af3c3104e06ca444085b5e27920f'
            '1fbd0dcc55c66738b1b591632132c927de20c8443dff1d55b4851e378883e402')
sha256sums_x86_64=('17044b1e089b49ea8ebaad78d92448b8f6c8c3c6151e04a09b0b87e3592f583d')
sha256sums_aarch64=('6056955acced9cc046df1a380d200fce51003133cb442614b77e06f0ceffca5b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

