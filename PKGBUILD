# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: desbma

pkgname=zoxide-bin
pkgver=0.7.4
pkgrel=1
pkgdesc='A fast cd command that learns your habits (binary release)'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/ajeetdsouza/zoxide"
license=('MIT')
provides=('zoxide')
conflicts=('zoxide')
changelog=CHANGELOG.md
source_x86_64=("zoxide-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/zoxide-x86_64-unknown-linux-musl.tar.gz")
source_armv7h=("zoxide-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/zoxide-armv7-unknown-linux-musleabihf.tar.gz")
source_aarch64=("zoxide-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/zoxide-aarch64-unknown-linux-musl.tar.gz")
sha512sums_x86_64=('57c26063737d4ccbdf8537b6cda92d0fdd1b478235c5df033ea85750fe2f621dfc24b0151d228ba49a93ab947d3b7b590760d3f1cf3a14aa21c5a820b75c7f38')
sha512sums_armv7h=('58453b35d983c76eb413fd1bd686b6aa1edca0cc2c7dd05359e9826a05c5a8515da2d703acfb732e1e81fc5a1f98974c37cf432a190f0d1971e702211df287cd')
sha512sums_aarch64=('f92afe801972a7ee9ef3e970e5c20390942c01729267417e2c0b54d8e0dc08fd9bd9d9754baf5322a29ac3a1f5956d2cdbe5abeab215f272ebfbf870b9ddcb3a')

prepare() {
  if [[ "$CARCH" == 'armv7h' ]]
  then
    mv zoxide-armv7-unknown-linux-musleabihf "zoxide-$CARCH-unknown-linux-musl"
  fi
}

package() {
  cd "zoxide-$CARCH-unknown-linux-musl"
  install -Dm 755 zoxide -t "$pkgdir/usr/bin/"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  find man \
    -type f -exec install -Dm 644 '{}' -t "$pkgdir/usr/share/man/man1/" \;
}
