# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sinclairtarget
_pkgname=git-who
pkgname=${_pkgname}-bin
pkgver=1.2
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
            '8a17bbe4334a87e4c92fcb9adb54c5277c2253b1160a5afcdfc990eb70c36171')
sha256sums_x86_64=('ec7ed247b52867e5d303948511a52aede8754a53d1dd9a39cc1dc66f181beee6')
sha256sums_aarch64=('195e254a1f77591950031463024923ab09abbdd306b1701ef07d4ccbc10d0fdb')

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
