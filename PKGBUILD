# Maintainer: pro_shunsuke <shunsuke0901@gmail.com>

pkgname=colmsg
pkgver=5.0.0
pkgrel=1
pkgdesc='A CLI tool for '櫻坂46メッセージ', '日向坂46メッセージ', '乃木坂46メッセージ', '齋藤飛鳥メッセージ', '白石麻衣メッセージ', and 'yodel' app.'
arch=(x86_64)
url='https://github.com/proshunsuke/colmsg'
license=(MIT)
makedepends=(clang cmake git rust)
depends=('gcc-libs' 'openssl')
source=("git+$url#commit=09d15b69e5aa2dd7abc6e78ad658096fc25254ae")
sha256sums=('SKIP')

build() {
  cd $pkgname
  cargo build --release
}

package() {
  cd $pkgname

  # Package the executable
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"

  # Package the license files
  install -Dm644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Disable makepkg C/C++ LTO; Cargo release LTO remains enabled.
options+=( !lto )
