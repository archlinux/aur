# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: desbma

pkgname=zoxide-bin
pkgver=0.7.3
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
sha512sums_x86_64=('fdbaca1848fe3ca18c72195fc229f291a2dafdc2fe1f70e3d52c1a47755c904eab50aff8ffa11c3ced61b52722c41d3093ca2eebafbf35b81c6cb60e69fa5e6f')
sha512sums_armv7h=('eb3ce351ae5b3eebb0640ae3c2ebc47fdeb6f16386270cbde391af66032ef24094a2a06387aa5ed60497c66d5f2fb3f1cdc08607919082cf46e38e2a4f628dc1')
sha512sums_aarch64=('a3bdbc7d98ec9e478f863e487bfa53f8a0321fba773384bf15ec104093670b1f056b1e135f6670cd9bd8439d1fbd2e216b6ade8e94201c059e08a5c7d10a6d1c')

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
