# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=SagarMaheshwary
_gitname=reqlog
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Fast CLI for searching, tracing, and streaming logs across files, Docker containers, and remote hosts"

pkgver=0.10.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

depends=('glibc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('fe74b81387008efdffb26c37184d92157b7c175446bc727e84b43ab2f3fa562f'
            '9f88798985c010e225b1ec2a9336fd560317a5be0553e45e188d25287e514a58')
sha256sums_x86_64=('bf9df3201b617243a63d0ba408ed9b5d934b7d29fb217777d51a0a3355600817')
sha256sums_aarch64=('303e9dc8fe509c3d2a1fe4fbfaf7158c51f21dcbcaaaae6eaa7362faff771bb2')


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

	install -Dm755 "${_appname}-${_CARCH}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
