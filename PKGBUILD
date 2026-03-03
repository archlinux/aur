# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=valentinradu
_pkgname=Pent
_appname=${_pkgname,,}
pkgname=${_pkgname,,}-bin
pkgdesc="Wrap any process in a filesystem and network sandbox"

pkgver=0.0.5
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
sha256sums=('7d16e0dcca6c457f4169de8aae6cda9c56140f9a6d8a72bce1023def39091f19'
            'fdbff1942963f9e9e15aecb13800bb42886a349a681b94236d511d6715d27fbd')
sha256sums_x86_64=('fde5d3cf49359f2fe16c09eca64636c5092958dc070cbc75a269df0f8fe9459f')
sha256sums_aarch64=('7ecae33b5e058a495d40cd4ce5825c72a5aef84384aa5c70ecff8e3f21b0831b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
