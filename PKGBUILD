# Maintainer: Bao Trinh <qubidt@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher-cli-bin
_pkgname=etcher-cli
pkgver=1.4.9
pkgrel=4
pkgdesc="Burn images to SD cards & USB drives, safe & easy"
arch=('i686' 'x86_64')
url="http://www.etcher.io/"
license=('Apache')
provides=('etcher-cli')
conflicts=('etcher-cli' 'etcher-cli-git')
depends=('gcc-libs')
optdepends=()
source_i686=("${pkgname}-${pkgver}-${CARCH}.tar.gz::https://github.com/balena-io/etcher/releases/download/v${pkgver}/balena-etcher-cli-${pkgver}-linux-x86.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-${CARCH}.tar.gz::https://github.com/balena-io/etcher/releases/download/v${pkgver}/balena-etcher-cli-${pkgver}-linux-x64.tar.gz")
noextract=("${pkgname}-${pkgver}-${CARCH}.tar.gz")
options=("!strip")
sha256sums_i686=('4af2f1662fbbc2e7ee9b4d50f52b403b9ca5a1c6a83f56cbf1b6bb5368b90ced')
sha256sums_x86_64=('67d1173fdf7c4c528f4027147463597cffdef9d50ddcf0c74c9651685b1c451e')

prepare() {
    mkdir -p "${pkgname}-${pkgver}-${CARCH}"
    bsdtar --strip-components 1 -zxf "${pkgname}-${pkgver}-${CARCH}.tar.gz" -C "${pkgname}-${pkgver}-${CARCH}"
}

package() {
    install -dm755 "${pkgdir}/opt"
    cp -ra "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/opt/${_pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    ln -snf "/opt/${_pkgname}/balena-etcher" "${pkgdir}/usr/bin/etcher-cli"
}
