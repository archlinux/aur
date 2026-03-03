# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=valentinradu
_pkgname=Pent
_appname=${_pkgname,,}
pkgname=${_pkgname,,}-bin
pkgdesc="Wrap any process in a filesystem and network sandbox"

pkgver=0.0.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('c9830e6fb1d65b3089d54be87ac12609f64ac0e2aed578a5145ba6a90a127115'
            'fdbff1942963f9e9e15aecb13800bb42886a349a681b94236d511d6715d27fbd')
sha256sums_x86_64=('92c211b7626f61bd39ea66cf085b95de71bb9484587ccfe321146122afb9fd62')
sha256sums_aarch64=('7b07cacd5c2668933483a955008073bcd70fc09ef2b3faa56aa9d5a6e2a0c183')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
