# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ssleert
_pkgname=zfxtop
pkgname=${_pkgname}-bin
pkgdesc="fetch top for gen Z with X written by bubbletea enjoyer"

pkgver=0.3.2
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'i686')
_barch=('amd64' '386')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('BSD-2-Clause')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/.github/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
sha256sums=('02e9b43e0d03fe54ac4303c6d39caa5c2b173976d1fb8553c351acc383e81350'
            '237180dd714c7241872e986597c33eb5a283a958343977067ba807802355950f')
sha256sums_x86_64=('5121708cd3e206d6439899a88fe1ce5293179eee9fd47061a5eece07763b3edc')
sha256sums_i686=('3da8cb2c654406ec91a37cab93ac1681e2d66abbb2fb42469185772c5eae2c71')

case ${CARCH} in

  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}_${pkgver}_linux_${_CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
