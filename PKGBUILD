# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=thobiasn
_pkgname=tori-cli
pkgname=${_pkgname}-bin
pkgdesc="Lightweight Docker monitoring with alerting"
_appname=${_pkgname%%-cli}

pkgver=0.2.2
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
sha256sums=('978f6e7aae86c64f8141de074a000d74c5856579c3cfbc4c1acf1c5036c00e37'
            'dd4323e456ce3acd4d0cb493238861b3eca0f1a1df5845b9babf0b6e5738dff8'
            'dc02531f019bb5f48aeeda9feec15e9faa3c5be3b27d81657af390659ba74ec9'
            '32544b8d9efe9262b43d2f96bb150ce9d73945e82a5b67c06281a2e45a9d1241'
            '98357980142450ebe781b28be81964dc5e2651499f9f098bd13da32173f3f539'
            'adeab60faa35075ff8adf4e96afe6cad56a4bd801a7c1f776a2f4104c3d522d0'
            '57cd1949897e7280e98b50df088880af2ca5dfd984b5ff6016db355c2439b7a7')
sha256sums_x86_64=('fde89e6eeca4e186225e0ffaa1fa5fa47227a8f42e1258a469f96406f861b82d')
sha256sums_aarch64=('0d9804bfea9da19330504e2d7915c9a3e81f29640a1878feab736bfcecf1d2bc')


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
