# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=gocron
_pkgauthor=gocronx-team
_pkgbase=gocron
_pkgname=${_pkgbase}
pkgbase=${_pkgbase}-bin
pkgname=(${_pkgbase}-bin ${_pkgbase}-node-bin)
pkgdesc="Distributed Scheduled Task Scheduler"

pkgver=1.6.7
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz"
               "${_pkgname}-node-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-node-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[1]}.tar.gz"
                "${_pkgname}-node-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-node-${_barch[1]}.tar.gz")
sha256sums_x86_64=('11654f9c85041fa9d6ddd53ec8a156efae38c299cec07c5abf0da90cc93f3779'
                   '68a979c7951a93638203f842947153790776b1f82c78c391add8b77c6bcc3ccb')
sha256sums_aarch64=('07a55116b4f0f4388879a1eac559bcdc68a0a5eeae44e3480a3ad80c55b68285'
                    '4f17db88fb070a9e9cf590b3567eeb7f22767c0bc34a9acbd739ce1a3708a45e')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package_gocron-bin() {
	provides=("${_appname}")
	optdepends=("${_appname}-node")

	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_gocron-node-bin() {
	provides=("${_appname}-node")
	optdepends=("${_appname}")

	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-node" "${pkgdir}/usr/bin/${_appname}-node"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
