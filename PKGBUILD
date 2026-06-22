# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=eugenioenko
_gitname=ttt
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal text editor IDE"

pkgver=0.3.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

optdepends=('git: Source Control Features' 'ripgrep: Workspace Search')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}")
sha256sums=('d21ba50e5c3251433633baa0d93a89a60671932a764af78ca10e216ab9c22a40'
            'c707616518e3fce85635504ec18ab7d12e204686a56f0b683601e300e6429aa2')
sha256sums_x86_64=('0bbe21096ed4ddf00ba8c20e449ec2d46f38717acb3f72f45751fabf69c6cdb4')
sha256sums_aarch64=('8d82c303d15bbdf58d937a8f54489d455589f4e183eb2d43b84060c4b1ac9f7f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
