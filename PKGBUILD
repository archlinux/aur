# Maintainer: Magnus Anderson <magnus@iastate.edu>
pkgname=ascii-image-converter-git
pkgver=1.13.1.r0.gd05a757
pkgrel=1
pkgdesc="A cross-platform command-line tool to convert images into ascii art and print them on the console."
arch=('x86_64')
url="https://github.com/TheZoraiz/ascii-image-converter"
license=('Apache')
# I'm not sure if it depends on any other libraries, I think Go takes care of it
makedepends=('go')
provides=('ascii-image-converter')
conflicts=('ascii-image-converter')
source=("git+https://github.com/TheZoraiz/ascii-image-converter.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}
build() {
  cd "${pkgname%-git}"
  go build
}
package() {
  cd "${pkgname%-git}"
  install -Dm 755 ./ascii-image-converter -t "$pkgdir/usr/bin/"
}
