# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=thobiasn
_pkgname=tori-cli
pkgname=${_pkgname}-bin
pkgdesc="Lightweight Docker monitoring with alerting"
_appname=${_pkgname%%-cli}

pkgver=0.3.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}")

install="${_pkgname}.install"


backup=("etc/${_appname}/config.toml")

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "${_pkgname}.config"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles"
        "${_pkgname}.install")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}_${pkgver}_${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}_${pkgver}_${_barch[1]}")
sha256sums=('83f6ec88eb8e6ffd6ce08ad18a604c61fc60be0d68a07193ae4884081f0920aa'
            'dd4323e456ce3acd4d0cb493238861b3eca0f1a1df5845b9babf0b6e5738dff8'
            'dc02531f019bb5f48aeeda9feec15e9faa3c5be3b27d81657af390659ba74ec9'
            '81c3df0de337c3cd841f1f942ec2f99ada6db1b7d178b3bb30d179093e9f16a6'
            '8e7643af97932406d4de791a4d540df324d20ce40ee6d59f2729efd1ca835901'
            'b9e0bcaaf31788d36e08c0673d1e36c65d287aecad96ec8dae15f59047713870'
            '57cd1949897e7280e98b50df088880af2ca5dfd984b5ff6016db355c2439b7a7')
sha256sums_x86_64=('9be0c2a1a0d0270367c5335aeaa66bb6340cfa071f772159f7d000e84e47d8bf')
sha256sums_aarch64=('09625d87cc3021a4dfdfbe8a89a63c24533b5658e9a6c17edea0c5ffbfa65a65')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_pkgname}.config" "${pkgdir}/etc/${_appname}/config.toml"

	install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_appname}.service"

	install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
