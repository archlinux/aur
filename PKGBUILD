# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=nutty
pkgver=1.1.1
pkgrel=1
pkgdesc='A network utility for linux. Monitor the devices on your network and check bandwidth and speed details.'
arch=('i686' 'x86_64')
url='https://github.com/babluboy/nutty'
license=('GPL3')
depends=('gtk3' 'granite' 'sqlite' 'libxml2' 'libnotify' 'libgee' 'net-tools' 'nethogs' 'nmap' 'traceroute' 'vnstat' 'curl' 'wireless_tools' 'iproute2' 'pciutils')
makedepends=('vala' 'meson')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
install="${pkgname}.install"
source=("https://github.com/babluboy/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b6c9ef1966d1c60480943313f20cd66ee1b5d23ac8d6578f457fb99f0898d9ba')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}


build() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  arch-meson
  ninja
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  DESTDIR=${pkgdir} ninja install
}

