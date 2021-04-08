# Maintainer: gbr <gbr@protonmail.com>

_pkgname=Myxer
pkgname=myxer
pkgver=1.1.3
pkgrel=2
pkgdesc='A modern Volume Mixer for PulseAudio.'
arch=('x86_64' 'aarch64')
url='https://github.com/Aurailus/Myxer'
license=('GPL3')
depends=('gcc-libs' 'gtk3' 'libpulse')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'myxer.desktop')
sha512sums=('b8e9b84378a833156f4e8f71e9c8d823332994447bfdf2033d4aae043af8b01c9d088f45b862b477c5c692325cfdaeb89d23d6b49bc5a1abc9d0a63f029992f7'
            '7cc782ba29dbe03dc242e65880184f047ae2ebf0dd2aaa3ab534df78e2a037f5a69fe332752fce87312a452dabf3da3b70a30d6baa8059ce0216acd1333b80be')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --locked --release
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --locked --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 'LICENSE.md' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

