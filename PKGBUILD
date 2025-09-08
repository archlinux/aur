# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>

pkgname=librem5-flash-image
pkgver=0.0.5
pkgrel=1
pkgdesc="Image flashing tool for Librem 5 devices and related devices"
url="https://source.puri.sm/Librem5/librem5-flash-image"
arch=('any')
license=('GPL-3.0-or-later')
depends=('python' 'python-requests' 'python-tqdm' 'python-yaml' 'usbutils' 'mfgtools')
optdepends=('python-coloredlogs: for colored logs'
            'python-python-jenkins: for downloading daily snapshots')
makedepends=('help2man')
source=("${pkgname}-${pkgver}.tar.gz::https://source.puri.sm/Librem5/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('da0598d11aaddeb54b8b181c6e4ba1c9e75f9ba3506496af73352b002beb0bff')

build() {
  cd ${srcdir}/${pkgname}-v${pkgver}
  help2man -N --version-string=${pkgver} \
           --name="Image flashing tool for Librem 5 devices" \
           scripts/librem5-flash-image > librem5-flash-image.1
}

package() {
  cd ${srcdir}/${pkgname}-v${pkgver}
  PREFIX="$pkgdir/usr" make install
  install -Dm644 librem5-flash-image.1 "$pkgdir/usr/share/man/man1/librem5-flash-image.1"
  install -Dm644 debian/librem5-flash-image.librem5.udev "$pkgdir/etc/udev/rules.d/70-librem5-flash-image.rules"
}
