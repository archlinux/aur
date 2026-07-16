# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=jnsahaj
_gitname=lumen
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Beautiful git diff viewer, generate commits with AI, get summary of changes, all from the CLI"

pkgver=2.32.0
pkgrel=1
_gitversion=v${pkgver}

_libc='gnu'
arch=('x86_64' 'aarch64')
_barch=("x86_64-unknown-linux-${_libc}" "aarch64-unknown-linux-${_libc}")

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'zlib' 'git')
optdepends=(
    'fzf: Required for lumen list command'
    'mdcat: Required for pretty output formatting'
    'ollama: Local AI provider'
)

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('cf8a983299aa8a14bfb57cb68152081eb347c1f6df396f9783d0784368ddd581'
            'eb0958555412fded4d0932fa36d239ef3929c95c061fd556f8f16e446c49fbb7')
sha256sums_x86_64=('596ea1dc78f63dd419854206adb2038a04be2248084373602c9a88a4efbf51a1')
sha256sums_aarch64=('ebdb801b5639a913094dff1820c7b5ace91cedb0832dd027a16abe1d557eea89')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
