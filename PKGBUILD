#!/hint/bash -e
# Maintainer: Adrien Smith <adrien@panissupraomnia.dev>
# Contributor: Martin Poljak <martin at poljak dot cz>
# Contributor: Dan Schaper <dschaper at ganymeade dot com>

pkgname=tcllauncher
pkgver=1.10
pkgrel=1
pkgdesc='A launcher for Tcl applications'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://flightaware.github.io/tcllauncher'
license=('custom:Tcl')
depends=('libbsd' 'tcl')
options=('!emptydirs')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::https://github.com/flightaware/$pkgname/archive/v$pkgver.tar.gz"
        'tcllauncher-use-custom-ldflags.patch')
b2sums=('76d4ec2ee4a8509c2cf9f7c95dea642f229d64c51fbb4d23b07bea2e5fe784dec052c7fe3ba6b625a268b00b3110eec5a0bac2ce812c64e56b121983f22b6569'
        'e378ebbe366066889616fc1c2fc5d68486b0651165c472bc69a221dde5751a0817dea4633618d28730032a739288220945739f13723c94de9392250479f06802')
sha512sums=('822524e738f80460f300ce876a71bd60e2820ebe4a3b5f3d64d496720d2467c32440f6ef6ccd59ca71ffdf69b5ba01ab341ff39d402d268e1e495a61b0aea430'
            '4206e143ece18fd28faa9da62918710166a09881ecf4dba4982599241303abffac0d055c075eab9369a8d8e3199986e8cdd4c38424bcd52838084211a0406ec5')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 < ../tcllauncher-use-custom-ldflags.patch
}

build() {
  cd "$pkgname-$pkgver"
  autoconf
  ./configure --disable-rpath
  make
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}"
  install -Dm644 license.terms "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
