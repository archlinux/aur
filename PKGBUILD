# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=AppachiTech
_pkgname=suvadu
_appname=suv
pkgname=${_pkgname}-bin
pkgdesc="A database-backed shell history replacement with fuzzy search, AI agent monitoring, and interactive TUI"

pkgver=0.4.0
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
sha256sums=('33a53f25211517cdb6e3b1b56321e81ee6396a3947e8b67a15733602a7ba01ae')
sha256sums_x86_64=('a429991c8c9c467a8606962879e3876f6257783a282efc36d22ecd7592b59161')
sha256sums_aarch64=('940210a0f5c7b52c5f428c7a701c41cdcfc3372f73ab6bf2bc4d4acbd1216981')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"
	ln -sf "/usr/bin/${_appname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
