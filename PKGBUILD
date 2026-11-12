# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jdx
_pkgname=packslip
pkgname=${_pkgname}-bin
pkgver=1.11.4
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A signed release manifest for vendor binaries"
arch=('x86_64' 'aarch64')
_barch=('x64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.xz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${_barch[0]}.tar.xz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.xz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${_barch[1]}.tar.xz")
sha256sums=('b88d66b6653e1c48856f66ad51b5a7c97e9496b85b9ae23fe7a1c9ec17fd02d8'
            '821abac2a5f69f55177241b3eeff61125a9f37e83b1d297639300ef8b93b0c73')
sha256sums_x86_64=('011ccc784584a466bd12a96f76c8e7a3ff365a2c99aee53884140cecf020aadd')
sha256sums_aarch64=('0cd0e3f96917dacbc0a993affacfc2a838df2503e3ac2017cee072c064cb30bc')


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

	install -Dm755 "${_pkgname}-${_pkgvername}-linux-${_CARCH}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
