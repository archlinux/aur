# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mostlygeek
_pkgname=llama-swap
pkgname=${_pkgname}-bin
pkgver=229
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
sha256sums=('efe3c3d8e3dc1d880f44555713d702315ca7983d700a1c0d8a3829c3c2c8735e'
            '8f247fec3e347c212006415e23260a4851ccc435ea3fe0b2c7eaed12b49c406c')
sha256sums_x86_64=('01d25fe4a66099b19ba09ebbd404e89c3567a2e0a9b3fdf8881029271f060fcd')
sha256sums_aarch64=('005c8819a29832004dedad9f222d4edbcd915a3bc689c43ae9971fbbce02edc8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644  "CONFIG-${pkgver}.yaml" "${pkgdir}/etc/${_pkgname}/config.yaml"

	install -Dm644  "llama-swap.service" "$pkgdir/usr/lib/systemd/system/${_pkgname}.service"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
