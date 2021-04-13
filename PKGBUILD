# Maintainer: gbr <gbr@protonmail.com>
_pkgname=Myxer
pkgname=myxer
pkgver=1.2.1
pkgrel=1
pkgdesc='A modern volume mixer for PulseAudio'
arch=('x86_64')
url='https://github.com/Aurailus/Myxer'
license=('GPL3')
depends=('gtk3' 'pulseaudio')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'myxer.desktop')
sha512sums=('e7239a5e2c782bff4ce28d1bafbc2c48d723648150ddb4bfa77c9754a7cf1c0c7a6d47ead82787148087e13c06c339a2e4436eb968e63ea79261a3325b0d9f85'
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
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

