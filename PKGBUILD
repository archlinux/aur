# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=SimpleArchiver
_pkgauthor=Stephen-Seo
_pkgname=${_appname,,}
pkgname=${_pkgname}-bin
pkgver=3.3.1
pkgrel=1
pkgdesc="An alternative to tar"

license=('ISC')
_arch_prefix='debian'
arch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}_${_arch_prefix}_${arch[0]}")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}_${_arch_prefix}_${arch[1]}")
sha256sums=('db7f7ce8121ec5084ef74e60e72d22f165f6d7d6664a1af5ccdbb956e1f38793'
            '9a48f9f4d5049a011fafdd9903adb42d0f864b4f43afd530dd855fc1f38dbeb3')
sha256sums_x86_64=('a3493dc33718152bb245f8d354226dfc9bdb78a71b55fdcfdff83a8aaeec87db')
sha256sums_aarch64=('4aaf1c93f634e92d76603f8dcd89e157dc07c2cd2d11929557b92770c49ab435')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}_${_arch_prefix}_${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
