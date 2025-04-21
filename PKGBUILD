# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=eduardoagarcia
_pkgname=shef
pkgname=${_pkgname}-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Shef is a powerful CLI framework for cooking up dynamic shell recipes."
arch=('x86_64' 'aarch64')
_carch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_${_carch[0]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_${_carch[1]}.tar.gz")
sha256sums=('583c4443759bd61734c60fb46e4e38f7980e231e84fbcd3dcad870ee5a403773'
            'e0e0071fe4a35323f3279fb830f67ec4f4491b2810f69e241c16686c869c43fe')
sha256sums_x86_64=('64f29a099bacef24991e98ad98f7d1d74b84e23c1ccd9be0a56c9cf2a6abcc03')
sha256sums_aarch64=('ae1af9e899ba8c7eb099b08c858dbefd1baad686d02436c6aa3470188014cd67')


package() {
	cd "${srcdir}/" || exit

	if [[ $CARCH =~ ${arch[0]} ]]; then
		install -Dm755 "${_pkgname}_linux_${_carch[0]}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	else
		install -Dm755 "${_pkgname}_linux_${_carch[1]}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	fi

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
