# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=lusingander
_gitname=stu
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="TUI explorer application for Amazon S3 (AWS S3)"

pkgver=0.7.6
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('7b059989fdf7e40d48d0382f5cdf25c5b1af0bdae6fdf8c441b5b50700343953'
            'a175842e633d7fadbaeda6163e4bd9907af3fa9e3b240f9de82540e7882751db')
sha256sums_x86_64=('78aa850772f068b44eefa91732e345b30bcd17476ac23cb808f6b285a8162126')
sha256sums_aarch64=('d2bd884ede4ad05483847719daa4343de792f242c711df9ac8e35112caae1965')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
