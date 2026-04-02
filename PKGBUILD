# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=AppachiTech
_pkgname=suvadu
_appname=suv
pkgname=${_pkgname}-bin
pkgdesc="A database-backed shell history replacement with fuzzy search, AI agent monitoring, and interactive TUI"

pkgver=0.3.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}" "${_appname}")
conflicts=("${_pkgname}")

depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}-${_pkgvername}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}-${_pkgvername}.tar.gz")
sha256sums=('af1467f858694f6624432fe421bdf47560fe2fb927bd7cea416220b9a1ad1cdf')
sha256sums_x86_64=('22b5dbc5994f6f20e0c0065bcb5586b74e2971eea85f5ecb6476ce467b07cc09')
sha256sums_aarch64=('e7714cdbf06adfbd6fe3582cb6420e439944d935222d03f4c57b9f2d4efccc14')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"
	ln -sf "/usr/bin/${_appname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
