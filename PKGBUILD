# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ryancswallace
_gitname=Jobman
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A daemon-less command line job manager with flexible support for retries, timeouts, logging, notifications, and more..."

pkgver=1.5.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux_amd64' 'linux_386' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

backup=("etc/${_appname}/${_appname}.yml")

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_i686=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[2]}.tar.gz")
sha256sums_x86_64=('55d9c9209fe3682bc47e6b255a467905d6772b46dcde9a5e5d220382434badd4')
sha256sums_i686=('96800e7ad40624b65fbcb2b6e0d4f5959ca6c66dd01a2402bf0edf1d445a0d1d')
sha256sums_aarch64=('44fdd7f4933170f3a72988dcc2c985539dc754c58dc960a72402ab107b7b3829')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 ${_appname} "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 etc/${_appname}/${_appname}.yml "${pkgdir}/etc/${_appname}/${_appname}.yml"

	install -D -m644 docs/completions/bash/${_appname} "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -D -m644 docs/completions/zsh/_${_appname} "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"

	for man in docs/manpage/*.1; do
		install -Dm644 ${man} "${pkgdir}/usr/share/man/man1/$(basename ${man})"
	done

	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 THIRD_PARTY_NOTICES.md "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
}
