# Maintainer: TX1683 <tx1683@gmail.com>

_pkgname=galaxy42
pkgname=$_pkgname-git
pkgver=0.3.1b.r137.g69ccfe96
pkgrel=1
pkgdesc='An encrypted Meshnet and VPN software.'
url='https://github.com/yedino/galaxy42'
license=('GPL3')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('libtool' 'boost' 'libsodium' 'fftw')
makedepends=('git' 'gcc' 'cmake' 'bash')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
install="${pkgname}.install"

build() {
  cd $_pkgname 
  ./do --go
}

package() {
  cd $_pkgname/build
  install -Dm754 tunserver.elf "$pkgdir/usr/bin/tunserver.elf"
}
