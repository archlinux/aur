# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.6.1
pkgrel=1
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://github.com/WerWolv/ImHex'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'glm' 'capstone' 'llvm' 'nlohmann-json' 'python' 'freetype2' 'file' 'openssl' 'libiconv')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('6dcf7461fa15a396c5351942347e62e8a4bfdac47591761006001e8bd8d149d9208e01795eebc27fbdc2b5023021f783e7c6142a4da1b0fc484531b181d6b00f')

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPROJECT_VERSION="$pkgver" \
    -Wno-dev
  make -C build
}

package() {
  install -Dm0755 "build/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm0644 "$_pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm0644 "$_pkgname-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
