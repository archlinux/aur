# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=llhttp
pkgver=6.0.5
pkgrel=1
pkgdesc="Port of http_parser to llparse"
arch=('x86_64')
url="https://llhttp.org"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nodejs/llhttp/archive/refs/tags/release/v$pkgver.tar.gz")
sha512sums=('1600ed8ec1beab4f8c660a18cf6c486a7c894e6e2dd524a864868567527ecb93149a6808ca30f878e54df56d4ecba9afeb148955ce5bb18a3ec97e5135deeebc')
b2sums=('5f4fd2196af6f42abdb793f4c4ab2870b6f903266a927aa2d7dada02e931e7cfe15401bf7c7610d3029c0c51dec073a80f085e0c22d6cb437eac3bd500dfb39e')

prepare() {
  mv "$pkgname-release-v$pkgver" "$pkgname-$pkgver"
}

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DBUILD_SHARED_LIBS=on \
    -DCMAKE_INSTALL_PREFIX=/usr

  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE-MIT"
}
