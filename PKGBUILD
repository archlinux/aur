# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
_pkgname=tuxedo-drivers
pkgname=tuxedo-drivers-dkms
pkgver=4.15.3
pkgrel=1
pkgdesc="TUXEDO Computers kernel module drivers for keyboard, keyboard backlight & general hardware I/O using the SysFS interface"
url="https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers"
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('dkms')
options=(!debug)
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel'
            'udev-hid-bpf: resolve keyboard issues on the Sirius 16 Gen1/2')
# tuxedo-keyboard-ite = ite_8291, ite_8291_lb, ite_8297 and ite_829x
provides=('tuxedo-keyboard'
          'tuxedo-keyboard-ite'
          'tuxedo-io'
          'clevo-wmi'
          'clevo-acpi'
          'uniwill-wmi'
          'ite_8291'
          'ite_8291_lb'
          'ite_8297'
          'ite_829x')
conflicts=('tuxedo-keyboard-dkms' 'tuxedo-keyboard-ite-dkms')
#source=($pkgname-$pkgver.tar.gz::https://github.com/tuxedocomputers/tuxedo-drivers/archive/v${pkgver}.tar.gz)
source=($pkgname-$pkgver.tar.gz::https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz)
sha256sums=('29f2b2d6e3aeb2769fa0516c63eabc2c9fb140fbf831995dce9dd24fa49f4f13')
sha512sums=('5eb7b75e6aac3e3d9712aa01856e1913ccf3a20096702d14d1fb721e468c7567b0abe660988ea5d6f5bb25ae1a2bdceee9c827acc86e80e4d8d3c9c807d909cf')

package() {
  mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/udev/hwdb.d"
  mkdir -p "${pkgdir}/etc/"
  install -Dm644 "${_pkgname%}-v$pkgver"/debian/tuxedo-drivers.dkms "${pkgdir}/usr/src/${_pkgname%}-$pkgver/dkms.conf"
  sed -i "s/#MODULE_VERSION#/${pkgver}/" "${pkgdir}/usr/src/${_pkgname%}-$pkgver/dkms.conf"

  cp -rav "${_pkgname%}-v$pkgver"/etc/* -t "$pkgdir/etc/"
  cp -rav "${_pkgname%}-v$pkgver"/usr/* -t "$pkgdir/usr"
  cp -rav "${_pkgname%}-v$pkgver"/src/*  "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
}
