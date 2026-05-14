# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mostlygeek
_pkgname=llama-swap
pkgname=${_pkgname}-bin
pkgver=212
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

backup=("etc/llama-swap/config.yaml")

source=("CONFIG-${pkgver}.yaml::${_urlraw}/config.example.yaml"
        "llama-swap.service")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
sha256sums=('13e2408103999e64b637d7fb83dd49665220ca218afdb5dfb2941065d929afa7'
            '8f247fec3e347c212006415e23260a4851ccc435ea3fe0b2c7eaed12b49c406c')
sha256sums_x86_64=('a8623b2d755c50ab842790f3a7e668dad3b7bb90c33e2bab6eed3c8a9ba8a82d')
sha256sums_aarch64=('5e7721418ba3c6f323fae0fcef5c2a2a926e56ad2ad78d7f323301fab333e9ad')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644  "CONFIG-${pkgver}.yaml" "${pkgdir}/etc/${_pkgname}/config.yaml"

	install -Dm644  "llama-swap.service" "$pkgdir/usr/lib/systemd/system/${_pkgname}.service"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
