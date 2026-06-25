# Maintainer: rabbull <karl.liu.1024@gmail.com>
_pkgname=reckless
pkgname=reckless-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='Competitive UCI chess engine written in Rust (prebuilt binaries)'
arch=('x86_64')
url='https://github.com/codedeliveryservice/Reckless'
license=('AGPL-3.0-only')
depends=('libgcc' 'glibc')
options=('!debug')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$_pkgname-$pkgver-generic::$url/releases/download/v$pkgver/reckless-linux-generic"
        "$_pkgname-$pkgver-avx2::$url/releases/download/v$pkgver/reckless-linux-avx2"
        "$_pkgname-$pkgver-avx512::$url/releases/download/v$pkgver/reckless-linux-avx512")
sha256sums=('39a69c82b5bd8ef2b57db6c115128479a51dcd716c509360853bff41dbf9d273'
            'a165c726227593a0364e4d52d9a5a635f1b6e2481d559f043b4563957fda8685'
            '09ba1634faaffec55d237a7efecfb27d5152f6f1400f24dd63af9bde00a054f6'
            '0da69d9b7086bf5efe98602554769d83abe72adb2c2e92f189dc2af45e3dcd70')

check() {
  chmod +x "$_pkgname-$pkgver-generic"

  "./$_pkgname-$pkgver-generic" bench
}

package() {
  cd "Reckless-$pkgver"

  install -Dm755 "$srcdir/$_pkgname-$pkgver-generic" "$pkgdir/usr/bin/$_pkgname-generic"
  install -Dm755 "$srcdir/$_pkgname-$pkgver-avx2" "$pkgdir/usr/bin/$_pkgname-avx2"
  install -Dm755 "$srcdir/$_pkgname-$pkgver-avx512" "$pkgdir/usr/bin/$_pkgname-avx512"
  ln -s "$_pkgname-generic" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
