# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=remorses
_pkgname=tuitube
pkgname=${_pkgname}-bin
pkgdesc="Download videos from the command line with a TUI"

pkgver=2026.01.10
pkgrel=2121
_pkgvername="${_pkgname}%40${pkgver//\./}${pkgrel}"

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('baa23913a8cd0753e94cb2bf53b4e9df17a5b05ad638b7a430401f27a8595cc4')
sha256sums_x86_64=('26daf015f5803004ff7853ce45f7fa8c55aaec4afdc8d1639b75b5deec03e693')
sha256sums_aarch64=('b95a2b200f17321b83bc32e3c9d854d01bbbeec5be115eb5f234e63ef6bdbbed')

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

	install -Dm755 "${_pkgname}-${_CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
