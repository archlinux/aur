# Maintainer: Shiina Rikka <rikka@rikka.im>
_pkgname=mechrevo-drivers
pkgname=mechrevo-drivers-dkms
pkgver=4.17.0
pkgrel=1
pkgdesc='Kernel modules for MECHREVO devices. Drivers for several platform devices for MECHREVO notebooks meant for DKMS. Modified from TUXEDO drivers.'
arch=('x86_64')
url='https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers'
license=('GPL-2.0+')
depends=('dkms')
provides=('tuxedo-drivers-dkms'
	          'tuxedo-keyboard'
            'tuxedo-keyboard-ite'
            'tuxedo-io'
            'clevo-wmi'
            'clevo-acpi'
            'uniwill-wmi'
            'ite_8291'
            'ite_8291_lb'
            'ite_8297'
            'ite_829x')
conflicts=('tuxedo-drivers-dkms' 'tuxedo-keyboard-dkms' 'tuxedo-keyboard-ite-dkms')
source=($pkgname-$pkgver.tar.gz::https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers/-/archive/v$pkgver/tuxedo-drivers-v$pkgver.tar.gz patch.diff )
sha256sums=('fcaf13746fa877da69e0e3cf22938706c5cb45222e34888fde2522f519d552d2'
            'cec9ca635762733b3a307f008df541c7eb0c02fb1107d427255d7f42023d5ee2')

prepare(){
  cd "${srcdir}/tuxedo-drivers-v$pkgver"
	patch -Np1 -i ../patch.diff
}

package() {
  mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/etc/udev/rules.d/"
  install -Dm644 "tuxedo-drivers-v$pkgver"/debian/tuxedo-drivers.dkms "${pkgdir}/usr/src/${_pkgname%}-$pkgver/dkms.conf"
  sed -i "s/#MODULE_VERSION#/${pkgver}/" "${pkgdir}/usr/src/${_pkgname%}-$pkgver/dkms.conf"
  cp -ar "tuxedo-drivers-v$pkgver"/src/* "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
}
