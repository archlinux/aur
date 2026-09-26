# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mostlygeek
_pkgname=llama-swap
pkgname=${_pkgname}-bin
pkgver=260
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Model swapping for llama.cpp (or any local OpenAPI compatible server)"

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

backup=("etc/${_pkgname}/config.yaml")

source=("CONFIG-${pkgver}.yaml::${_urlraw}/docs/config.example.yaml"
        "${_pkgname}.service")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
sha256sums=('d8300989398c28c21afba733906dedee9ef1cd4773f5ec585d957f0c1f2ccb60'
            '685ccad3805b8b071490fb7b19ac5c616d144b48eac37a17fe89b68fcd13d04f')
sha256sums_x86_64=('d856a908507560cbdc253300bcf49092c7ead3c85098687428b0c9d4832ff46d')
sha256sums_aarch64=('e796fbb819d580dcccb9f86e64f7fd87044dae6fc0992a2ba6296145592aa059')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "CONFIG-${pkgver}.yaml" "${pkgdir}/etc/${_pkgname}/config.yaml"

	install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
