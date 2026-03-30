# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=altlimit
_pkgname=alt
pkgname=${_pkgname}-bin
pkgdesc="A stateless, zero-config CLI distribution proxy. Install any tool from GitHub Releases with a single command."

pkgver=1.0.5
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[1]}")
sha256sums=('7180e921d1580556481f4de4936cde8c1c14f8d0d5374987cd59b4513cb4ca59'
            'd8c7ce09908dd71397fb36e3d14eab399becd2848a5d83cb63030160cdf274ab')
sha256sums_x86_64=('d47a0e8c7821b5272bb6d04271f1adb10a4478c7a444b79d62b7b903a551c8cb')
sha256sums_aarch64=('8c7a23978c36f810ae8e5e041df16b7b1c0492b42f58a11b986803e6bcfce103')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
