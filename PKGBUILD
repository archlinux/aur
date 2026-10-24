# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=eugenioenko
_pkgname=autentico
pkgname=${_pkgname}-bin
pkgver=3.0.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A self-hosted OpenID Connect Identity Provider"

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://filebrowser.org/"
_gurl="https://github.com/${_pkgauthor}/${_pkgname}"
_gurlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

install="${pkgname}.install"

source=("${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles"
        "${pkgname}.install"
        "LICENSE-${pkgver}::${_gurlraw}/LICENSE"
        "README-${pkgver}.md::${_gurlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${_gurl}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${_gurl}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('d72a03a5318ad54abf104d5217695d8a876476a7ceb7946de93c4ca038a3a227'
            '89a0dfec88918685812716f1a49e3cccae98dac90cfc77cee3977f24e2c2d052'
            '2fe44e290ffa0c42b980b57b390ad064bb44d9c9aad9638484202dea422398dd'
            '3b79f7d6ba8815fe1ca808ce1f58156413b39d56651008aa7a6f02102202846f'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '4ed667a893932b1e87e82a06f30c8891361e8084dd58135d83fd8f21835ba49f')
sha256sums_x86_64=('9bbc148a056747b2f8b2daed4768149cf6e557b1881d1514c022275f74596259')
sha256sums_aarch64=('c0252311e1ea9c84c8c0c4bf6cddb4d7443851d09fced873de6f2a7798dd13e8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

	install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
	install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
