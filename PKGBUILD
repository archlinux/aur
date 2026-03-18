# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=thobiasn
_pkgname=tori-cli
pkgname=${_pkgname}-bin
pkgdesc="Lightweight Docker monitoring with alerting"
_appname=${_pkgname%%-cli}

pkgver=0.3.2
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
sha256sums=('118a2f61aa236f927f48b206154ef7f3cfceb0b337ddc65148996fc842213b9c'
            'dd4323e456ce3acd4d0cb493238861b3eca0f1a1df5845b9babf0b6e5738dff8'
            'dc02531f019bb5f48aeeda9feec15e9faa3c5be3b27d81657af390659ba74ec9'
            '81c3df0de337c3cd841f1f942ec2f99ada6db1b7d178b3bb30d179093e9f16a6'
            '6a5808aabf9eb9e8f7c726dacb5639f21cec05561c40ff7bcf059da99ade3ed0'
            'd9763ba73bb639e3d1dee431e3ca6a9974290cf4099cfdadf7c4fd1389675bee'
            '01f2ef183e2601de7f21df53a015589adac70769bc71fbdcf97aed8abf9f0fa1')
sha256sums_x86_64=('fc058f6a6c5328a8cbbd120d27d9d06b4fa59e12c752fa24eca656cef9679df4')
sha256sums_aarch64=('3ba15c778d9063f50b8c8930b5eff9f6f8149f568245d26996cdec38149d3ea3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm600 "${_pkgname}.config" "${pkgdir}/etc/${_appname}/config.toml"

	install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_appname}.service"

	install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
