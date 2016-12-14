# Original Maintainer: Evan Teitelman <teitelmanevan@gmail.com>
# Maintainer: Andrew Rembrandt <andrew@rembrandt.me.uk>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: Archie <Mymaud@gmail.com>

pkgname=garmintools
pkgver=0.10
pkgrel=5
pkgdesc="This software provides Linux users with the ability to communicate with the Garmin Forerunner 305 via the USB interface."
depends=('libusb-compat')
install="garmintools.install"
arch=('i686' 'x86_64')
license=('GPL')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/garmintools/$pkgname-$pkgver.tar.gz"
        "array-size.patch")
options=('!libtool')
url="http://code.google.com/p/garmintools/"
md5sums=('1a555a5174a82e92e0f5def1c4b01ae7'
         '9d6e627ec37afacc0783b8574e84bbf3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 -i "$srcdir/array-size.patch"
  ./configure --prefix=/usr
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make "prefix=$pkgdir/usr" install
}
