# Maintainer:  rafael silva <perigoso at riseup dot net>
# Contributor: bs mt <bsmt at bsmt dot me>

pkgname=socketcand-git
pkgver=0.6.1.r28.g02ad0f5
pkgrel=1
pkgdesc="Provide access to CAN interfaces on a machine via a network interface."
arch=('i686' 'x86_64')
url="https://github.com/linux-can/socketcand"
license=('unknown')
makedepends=('git' 'autoconf' 'libconfig')
source=("git+https://github.com/linux-can/socketcand.git")
md5sums=('SKIP')

pkgver() {
	cd 'socketcand'
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd 'socketcand'
  ./autogen.sh
  ./configure --prefix=/usr --disable-init-script --mandir=/usr/share/man/man1
}

build() {
  cd 'socketcand'
  make
}

package() {
  cd 'socketcand'
  make DESTDIR="$pkgdir/" install
}
