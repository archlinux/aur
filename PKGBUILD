# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=SagarMaheshwary
_gitname=reqlog
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Fast CLI for searching, tracing, and streaming logs across files, Docker containers, and remote hosts"

pkgver=0.9.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

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
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('e797424ab6e1b787dddfc5e0df9643eef10c3b46dbd5a7c2951d5c2dc421796f'
            '9f88798985c010e225b1ec2a9336fd560317a5be0553e45e188d25287e514a58')
sha256sums_x86_64=('1ab0e1db3844450d7047e3aa5d67ef445f30db704207f8add1f90148bb29f11d')
sha256sums_aarch64=('e7e48bf41d7b11dbd2c12d50be7b4354e9776ea4ebd7ecc47c10c34252505f18')


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
