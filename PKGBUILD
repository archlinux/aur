# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=gocron
_pkgauthor=gocronx-team
_pkgbase=gocron
_pkgname=${_pkgbase}
pkgbase=${_pkgbase}-bin
pkgname=(${_pkgbase}-bin ${_pkgbase}-node-bin)
pkgdesc="Distributed Scheduled Task Scheduler"

pkgver=1.7.0
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
sha256sums_x86_64=('d33555ccfe3d523d82953cfa5909565679d36de175186a9b678e6e0b74659cde'
                   '229b348537ea56604ff91a4883ac4e05cf79611ec1ff3c76f68eb48129e3d6a7')
sha256sums_aarch64=('80d82bf07c07b370d7d417b1f9165e56acd43263b911c7f7cc9dddb1e4c939b7'
                    '3d5a9df8e41eefae262459780c4e499cf2f9358c73fe51158629aac728c19d9e')


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
