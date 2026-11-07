# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=yaroshevych
_gitname=bypass
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Modern terminal secrets manager compatible with KeePass vaults"

pkgver=0.2.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('keepassxc')

options=('!strip')

source=("CLI-${pkgver}.md::${_ghurlraw}/CLI.md"
		"TUI-${pkgver}.md::${_ghurlraw}/TUI.md"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('881c5ae9a44cab171645240ee463c5ad69c6ef970aa2d58894649a90ff6fe397'
            '1bb2cfd5804ef3a83378d16a2e8fc77005ee74b661c2df0b9558f8e350855778'
            'fb5ff11f4ccee6f2f524ee51d61f03182cecea1ed66873ecdce67de4d13b6061'
            '54cf7b716c85a4a5911a09de2fe15689f6b40d1c27ca0bb6153c800f54e71570')
sha256sums_x86_64=('c9096ba8f45e38a8e5b965867cbe8d2aeeb0adf4a29d8652ed7c8550fdc34982')
sha256sums_aarch64=('87040eceeb52ab7723bf1893ce8b51e941f162025599c119a5450e1c6c095754')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "CLI-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CLI.md"
	install -Dm644 "TUI-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TUI.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
