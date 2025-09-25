# Maintainer: Philipp Marmet

pkgname=mgmt-bin
pkgver=1.0.0
pkgrel=0

pkgdesc='Next generation config management.'
arch=('x86_64' 'aarch64')
url="https://github.com/purpleidea/mgmt"
license=('GPL-3.0-only')
depends=('augeas' 'libvirt' 'libxml2-legacy')
backup=("etc/mgmt/mgmt.conf")
conflicts=('mgmt')
options=('!strip' '!debug')

source=("mgmt-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz")
source_x86_64=("mgmt-${pkgver}-bin"::"${url}/releases/download/${pkgver}/mgmt-linux-amd64-${pkgver}")
source_aarch64=("mgmt-${pkgver}-bin"::"${url}/releases/download/${pkgver}/mgmt-linux-arm64-${pkgver}")

sha256sums=('7cdffc7fbe110690ef427e5c2c0e1df4bf08e7ef6da0b3b68ed7fd755f201deb')
sha256sums_x86_64=('f8cd4c9595b1237aea5c6ba0799420ec733608bf22669514c8ae4739588a832c')
sha256sums_aarch64=('569a208c6d4d3e55a8a1b41283b3579f84976acdf45db7915d2690a3a2a6f65d')

package() {
  install -Dm755 "mgmt-${pkgver}-bin" "${pkgdir}/usr/bin/mgmt"
  install -Dm644 "${srcdir}/mgmt-${pkgver}/misc/bashrc.sh" "${pkgdir}/usr/share/bash-completion/completions/mgmt"
  install -Dm644 "${srcdir}/mgmt-${pkgver}/misc/example.conf" "${pkgdir}/etc/mgmt/mgmt.conf"
  install -Dm644 "${srcdir}/mgmt-${pkgver}/misc/mgmt.service" "${pkgdir}/usr/lib/systemd/system/mgmt.service"
}
