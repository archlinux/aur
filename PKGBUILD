# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=FrogSnot
_gitname=Concryptor
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A gigabyte-per-second, multi-threaded file encryption engine"

pkgver=1.0.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('AGPL-3.0-or-later')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-linux-${arch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-linux-${arch[1]}.tar.gz")
sha256sums=('6b144cfdbd66d88cd7b77c917cee616c2a38f73b022815412aa42ee400ab05fc'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('c28a79369f809a46d4810f17d744cc6ae209c1e88b91924b77fc2dc02a27ec8d')
sha256sums_aarch64=('d780d9e8d371624c8f74e8d5d0de4e3f242ebffe6291658727b7098d07052629')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-linux-${CARCH}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
