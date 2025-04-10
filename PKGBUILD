# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=juan-leon
_pkgname=fetter
pkgname=${_pkgname}-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Move processes into control groups based on configurable actions"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/fetter/config.yaml')

source=("config.yaml"
        "fetter.service"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "documented-example-${pkgver}.yaml::${_urlraw}/examples/documented-example.yaml"
        "minimal-example-${pkgver}.yaml::${_urlraw}/examples/minimal-example.yaml")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[2]}.tar.gz")
sha256sums=('6822d248cbd5a7a5c38bbd904752e0067d2421ea22ece950f8ac971daa34bce1'
            'be029852597e0751469f9c7405cb990f7b630cf394dd6d2a56a32a28f409a511'
            'dcbd4bbf50f4910032115da354b4ca13ba978deb086a0dc64bda687a24583f70'
            '206ea9930d24e31dd65b662735459bcdd0dce5cfba915c611849761db55d2fe5'
            'c44fd6982ee867111fd2643d259c7d9ec738990b6ed6f878b1a70f8ad36ea62c'
            'a79813b09996c9a7c5dac1eb94e4b324202d001c95cfb798fada88a9a14c2f29')
sha256sums_x86_64=('a6837667e5e144a51a3cd70923fb63fbd5328efc6d4a465adb2249015042ec72')
sha256sums_i686=('fccdc701a4630bf84281d54fc94d825e6d41a52c90f136c263ff945e2c8a00ba')
sha256sums_aarch64=('ff4da31b3f411f78de22ba11e4e940f9d6919cb20313bfbb9bf2d6f4ed16fdc6')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "config.yaml" "${pkgdir}/etc/${_pkgname}/config.yaml"

	install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

	install -Dm644 "documented-example-${pkgver}.yaml" "${pkgdir}/etc/${_pkgname}/documented-example.yaml"
	install -Dm644 "minimal-example-${pkgver}.yaml" "${pkgdir}/etc/${_pkgname}/minimal-example.yaml"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
