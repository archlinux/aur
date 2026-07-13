# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=TheKhanj
_pkgname=salsa
pkgname=${_pkgname}-bin
pkgver=0.0.8
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="TCP load balancer proxy with health checks"

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux_arm64' 'linux_386' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_${_barch[2]}.tar.gz")
sha256sums=('7362543def8c5f14537fc9852ea6b4fc1c13113d247098b5bb0ef0aa9f63828f')
sha256sums_x86_64=('dd70fda33967a1f5dfe618f3560cd491bd53fe6b50d4526bdecb2852c345f9f9')
sha256sums_i686=('b75256bf32581b3052552eadd09dc3e954c31485ec58a4493e78fc4d9976189c')
sha256sums_aarch64=('dd70fda33967a1f5dfe618f3560cd491bd53fe6b50d4526bdecb2852c345f9f9')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}//${_pkgname}_${_pkgvername}_${_CARCH}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm755 "${_pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
