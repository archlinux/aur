# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

gitauthor=Vitruves
gitname=firemark
appname=${gitname}
pkgname=${appname}-bin
pkgver=0.1.4
gitversion=v${pkgver}
pkgrel=1
pkgdesc="A fast, single-binary watermarking tool for images and PDFs"

arch=('x86_64' 'aarch64')
license=('MIT')

giturl="https://github.com/${gitauthor}/${gitname}"
giturlraw="https://raw.githubusercontent.com/${gitauthor}/${gitname}/${gitversion}"
url=${giturl}

provides=("${appname}")

depends=('glibc' 'libgcc')

conflicts=("${pkgname%-bin}")

options=(!strip)

source_x86_64=("${pkgname}-${pkgver}-${arch[0]}.tgz::${giturl}/releases/download/${gitversion}/${gitname}-${gitversion}-${arch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-${arch[1]}.tgz::${giturl}/releases/download/${gitversion}/${gitname}-${gitversion}-${arch[1]}-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('db22cb4c077221160765f924da29914639786df8c1a8d85051d31bbf05395ea2')
sha256sums_aarch64=('2cf0444dbba73d8c6c73d9a78054ef339f113582cdda54c5735b7535fc172931')


package() {
	cd "${srcdir}/${gitname}-${gitversion}-${CARCH}-unknown-linux-gnu/" || exit

	install -Dm755 "${appname}" "${pkgdir}/usr/bin/${appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
