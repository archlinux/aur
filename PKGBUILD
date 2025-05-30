# Maintainer: envolution
# Contributor: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=nutty
pkgver=1.2.0
pkgrel=1
pkgdesc='Monitor the devices on your network and check bandwidth and speed details.'
arch=('i686' 'x86_64')
url='https://github.com/babluboy/nutty'
license=('GPL-3.0-only')
depends=('gtk3' 'granite' 'sqlite' 'libxml2' 'libnotify' 'libgee' 'net-tools' 'nethogs' 'nmap' 'traceroute' 'vnstat' 'curl' 'wireless_tools' 'iproute2' 'pciutils')
makedepends=('vala' 'meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/babluboy/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f0e60b91a3799068a7c2e661acb96b12a46581782016707d060d17bc6fa1810e')

build() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  arch-meson
  ninja
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 COPYING -t ${pkgdir}/usr/share/licenses/${pkgname}
  cd "build"
  DESTDIR=${pkgdir} ninja install
}

# vim:set ts=2 sw=2 et:
