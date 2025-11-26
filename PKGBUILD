# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
_pkgname=tuxedo-drivers
pkgname=tuxedo-drivers-dkms
pkgver=4.18.1
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
sha256sums=('85cfbd4fd491f23026fff9d28d9ddf48fb15b6e0825a78cb891dba33a93854b1')
sha512sums=('c8290045eae1eb2dc518f883c72d56f93e1308319d3eb4e3aab83d27da87b9689845f1aff38bd79c09a9fec6da1b0f690c3cb00653edba800ef6ed3171c32682')

package() {

  install -Dm644 "${_pkgname%}-v$pkgver"/debian/tuxedo-drivers.dkms "$pkgdir/usr/src/${pkgname%-dkms}-$pkgver/dkms.conf"
  sed -i "s/#MODULE_VERSION#/$pkgver/g" "$pkgdir/usr/src/${pkgname%-dkms}-$pkgver/dkms.conf"

  install -Dm644 "${_pkgname%}-v$pkgver"/usr/lib/modprobe.d/*.conf -t "$pkgdir/usr/lib/modprobe.d/"
  install -Dm644 "${_pkgname%}-v$pkgver"/usr/lib/udev/rules.d/*.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 "${_pkgname%}-v$pkgver"/usr/lib/udev/hwdb.d/*.hwdb -t "$pkgdir/usr/lib/udev/hwdb.d/"

  cp -r "${_pkgname%}-v$pkgver"/src/* "$pkgdir/usr/src/${pkgname%-dkms}-$pkgver/"

}
