# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Ícar N. S. <icar.nin@protonmail.com>

_gitauthor=s0rg
_gitname=crawley
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="The unix-way web crawler"

pkgver=1.7.20
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_x86_64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('f545e35a6a24684ce063f5cbf7467144a507716c712f1c054b706fb39a7161eb')
sha256sums_aarch64=('38972123e49ea38815aa6f777e9a2360cb8acb29f39f3c61b197f5224b4f3f28')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
