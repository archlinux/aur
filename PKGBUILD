# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=nickprotop
_gitname=ServerHub
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A TUI server monitoring and management dashboard for Linux. Real-time metrics, logs, and remote control from your terminal"

pkgver=0.0.47
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'libstdc++')

options=(!strip)

source=("WIDGETS-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/widgets.tar.gz"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('ce3d0500cca0d8bb9f1625a5d6d314bff4ade62576b0ca771baabc106eae6b82'
            '48c9224eaad0665d4e645c25e8f571c31706eab1009ad7a6d388a1ed7cd30e87'
            '2c10c21061c318db599bce29e1a1ed265f1e91bb7a84c6a852e39b359b24539f')
sha256sums_x86_64=('91bd6e5214b6fc02374c2867d250cf20c98885f48a5b8f4adb37c2963c9c1752')
sha256sums_aarch64=('a3d228d757416697959740abac44189f5bbc17cba938eb94da16efeb5ac0052c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	for widget in *.sh; do
		install -Dm755 "${widget}" -t "${pkgdir}/usr/share/${_appname}/widgets/"
	done

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
