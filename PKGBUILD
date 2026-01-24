# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sinclairtarget
_pkgname=git-who
pkgname=${_pkgname}-bin
pkgver=1.3
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Git blame for file trees"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname//-/}_${_pkgvername}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname//-/}_${_pkgvername}_linux_${_barch[1]}.tar.gz")
sha256sums=('2707728d99e450c5df3dda7900d7061e17175b62603b237d65eb316468a36317'
            'cfd46ccda7e114bf6c843e995b4704615792e165de3772ec5470edf3817315c3')
sha256sums_x86_64=('f031ea951f837d1a67c906e3a672c6afe09c4314fa5bf7e63a00b86749f86b72')
sha256sums_aarch64=('86b9a856da39dc8d7f2dafb1ff1ce812227d5d45f9593a9553306e97da07c14d')

case "${CARCH}" in
	"${arch[0]}")
		_CARCH="${_barch[0]}"
		;;
	"${arch[1]}")
		_CARCH="${_barch[1]}"
		;;
esac

package() {
	cd "${srcdir}" || exit

	install -Dm755 "linux_${_CARCH}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
