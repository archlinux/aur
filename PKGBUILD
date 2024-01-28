# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=boblight
pkgver=2.1.0
pkgrel=1
epoch=1
pkgdesc="Collection of tools for driving lights connected to an external controller"
url="https://github.com/vdr-projects/boblight/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL-3.0-or-later')
depends=('libusb' 'libxext' 'libxrender' 'mesa' 'portaudio')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/boblight/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.service")
sha256sums=('c2a8d1638c80a941f05d63ce131c58e66033e1918f988dc8f4288d30d7066f9d'
            'cef865304a0819fe38e1dc0cc739da20e97da121bfc0c91f98e92b2a21998468')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="${pkgdir}" install
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
