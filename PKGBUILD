# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Co-maintainer: edu4rdshl <edu4rdshl at protonmail dot com>

_appname=copilot
_pkgname=${_appname}-cli
_barch=('linux-x64' 'linux-arm64')
pkgname=github-${_pkgname}-bin
pkgdesc="GitHub Copilot CLI brings the power of Copilot coding agent directly to your terminal."

pkgver=1.0.3
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://github.com/github/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/github/${_pkgname}/v${pkgver}"

license=("LicenseRef-GitHub-Copilot")
provides=("${_appname}")
conflicts=("${pkgname%%-bin}" "${pkgname%%-cli-bin}")
depends=('glibc' 'libgcc' 'nodejs' 'glib2' 'libsecret')
options=(!strip)
source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
		"copilot-${pkgver}-changelog.md::${_urlraw}/changelog.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('33657f2e7383f2167b47d5f8c549a6071905a5c93d5d67d17e5c5399f126f07b'
            '1fbd0dcc55c66738b1b591632132c927de20c8443dff1d55b4851e378883e402'
            'e31f09940db14e157c90965133150ae03909bc2f7b3a74e475057758cd27e697')
sha256sums_x86_64=('cf0e569594fda7d476c654e38a34bc95771349e7b6d7905d592bb4db24da7440')
sha256sums_aarch64=('2eb1851b501fdacf0e7cf0672c9a96ec704b754c31bc55983a033eeaaceb4aff')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "copilot-${pkgver}-changelog.md" "${pkgdir}/usr/share/doc/${pkgname}/changelog.md"
}

