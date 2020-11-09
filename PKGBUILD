# Maintainer: 1Conan <me@1conan.com>

_pkgrel=1

pkgname=libtvcontrol
pkgver=0.0.1
pkgrel=3
pkgdesc="A library to handle Advanced Breakout for Apple TV 4K. A library to control whether an Apple TV 4K boots to DFU or Normal mode using an Advanced Breakout."
license=('MIT')
url="https://github.com/lilstevie/libtvcontrol"
arch=('x86_64')
depends=('libusb>=1.0.19')
options=('!strip')
source=(
  https://assets.checkra.in/debian/libtvcontrol-dev_${pkgver}-${_pkgrel}_amd64.deb
  https://assets.checkra.in/debian/libtvcontrol-tools_${pkgver}-${_pkgrel}_amd64.deb
  https://assets.checkra.in/debian/libtvcontrol0_${pkgver}-${_pkgrel}_amd64.deb
)
noextract=("${source[@]##*/}")
sha512sums=(
  '7f6fdd49d3e23fbfc11e0c7e43e15aad75b21072196f25c84a44816c558e4da2a4710ee5bfca2c69bc6fdff83a2e0eeca05834764d258172b8db0d9e4335f6b0'
  '647b86ba63d358ab2ce8fe062709f8742ac2387735ef5cf905e1e0c2221a787a2b080ea0a4d9c265758c52fc3816f2008d67e8f6b42e297b1e9117706f2dabc0'
  'e7d4ebd9a65faaeb082a948249272dc7cf7c965531d266b13203b2c687123f8ab5e44ba9cd519c7724982e7c2b7511cab563407ae59cd8a31ce5cac372cb1076'
)

package() {
  for file in "${noextract[@]}"; do
    ar x $file
    tar -xf data.tar.xz -C $pkgdir
    rm data.tar.xz control.tar.xz
  done
  mv $pkgdir/lib/udev $pkgdir/usr/lib
  mv $pkgdir/usr/lib/x86_64-linux-gnu/* $pkgdir/usr/lib
  rmdir $pkgdir/lib $pkgdir/usr/lib/x86_64-linux-gnu
}
