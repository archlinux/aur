# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=valentinradu
_pkgname=Pent
_appname=${_pkgname,,}
pkgname=${_pkgname,,}-bin
pkgdesc="Wrap any process in a filesystem and network sandbox"

pkgver=0.1.0
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
sha256sums=('d27a9e1386f1b342251e72065079a22b9fbe9043cbe7dbf2805b2591e9c4a148'
            'fdbff1942963f9e9e15aecb13800bb42886a349a681b94236d511d6715d27fbd')
sha256sums_x86_64=('07c178d8ff1bf6ad7d6c6a4940bce1ea820e52ca69c04f9951e82b346da453d6')
sha256sums_aarch64=('369ed9f650a776fc6712351891380204d03980f4b5d47aa53a90fc5fcc5fa8fa')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
