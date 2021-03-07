# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-rpihddevice
pkgver=1.0.5
_vdrapi=2.4.6
pkgrel=1
pkgdesc="Output device for Raspberry Pi"
url="https://github.com/reufer/rpihddevice"
arch=('armv6h' 'armv7h')
license=('GPL2')
depends=('ffmpeg' 'mesa' 'raspberrypi-firmware-tools' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/reufer/rpihddevice/archive/$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('447cfcbd31dd9f443263e363d87a276386c29be41fb5f645b34fde5420bf412b'
            '9430415ac1a199d5b4dda831028071c16b9d47e02a0bf9960bcd31fd2b015e18')

build() {
  cd "${srcdir}/${_plugname}-$pkgver"
  make
}

package() {
  cd "${srcdir}/${_plugname}-$pkgver"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
