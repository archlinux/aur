# Maintainer: tleydxdy <shironeko(at)waifu(dot)club>

_pkgname=system76
_pkgbase=system76-power
pkgname=system76-power
pkgver=1.0.1
pkgrel=1
pkgdesc="System76 Power Management"
arch=('any')
url="https://github.com/pop-os/system76-power"
license=('GPL')
install="${pkgname}.install"
depends=(
  'dbus'
  'systemd'
  'system76-dkms'
)
makedepends=('rust')
source=(
  'system76::git+https://github.com/pop-os/system76-power.git#commit=de596615d3d1037f2377f3736a371b922e9bf0e7'
  )
sha1sums=(
  'SKIP'
)

build() {
  cd ${srcdir}/${_pkgname}

  # Build and install base package
  cargo build --release
}

package() {
  # Install daemons
  install -Dm755 ${srcdir}/${_pkgname}/target/release/system76-power ${pkgdir}/usr/bin/system76-power

  # Install systemd unit files
  install -Dm644 ${srcdir}/${_pkgname}/debian/system76-power.service ${pkgdir}/usr/lib/systemd/system/system76-power.service

  # Install scripts and configuration
  install -Dm755 ${srcdir}/${_pkgname}/data/system76-power.conf ${pkgdir}/usr/share/dbus-1/system.d/system76-power.conf
}
