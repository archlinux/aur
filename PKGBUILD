# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.6.1
pkgrel=2
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://github.com/WerWolv/ImHex'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'glm' 'capstone' 'llvm' 'nlohmann-json' 'python' 'freetype2' 'file' 'openssl' 'libiconv' 'hicolor-icon-theme')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
b2sums=('6dcf7461fa15a396c5351942347e62e8a4bfdac47591761006001e8bd8d149d9208e01795eebc27fbdc2b5023021f783e7c6142a4da1b0fc484531b181d6b00f'
        '7b2d029de385fdc2536f57a4364add9752b9a5dc31df501e07bff1fd69fdd1de2afa19a5ac5a4c87fbf21c5d87cc96d3fe30d58825c050f5a7d25f6d85d08efc')

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPROJECT_VERSION="$pkgver" \
    -Wno-dev
  make -C build
}

package() {
  # binary
  install -Dm0755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # license
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$_pkgname-$pkgver/LICENSE"

  # documentation
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    "$_pkgname-$pkgver/README.md"

  # desktop file(s)
  install -Dm0644 -t "$pkgdir/usr/share/applications" \
    "$pkgname.desktop"
  install -Dm0644 "$_pkgname-$pkgver/res/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/72x72/apps/$pkgname.png"
}
