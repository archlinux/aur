# Maintainer: AjayyXD ajaypradeep360@gmail.com
pkgname=hotspotctl-git
_pkgname=hotspotctl
pkgver=r28.b901638
pkgrel=1
pkgdesc="CLI tool to create and manage WiFi access points using hostapd, dnsmasq, and nftables"
arch=('x86_64' 'aarch64')
url="https://github.com/AjayyXD/hotspotctl"
license=('MIT')
depends=('glibc' 'hostapd' 'dnsmasq' 'nftables' 'iproute2')
makedepends=('git' 'gcc' 'make')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
