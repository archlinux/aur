# Maintainer: gbr <gbr@protonmail.com>
_pkgname=Myxer
pkgname=myxer
pkgver=1.2.0
pkgrel=3
pkgdesc='A modern volume mixer for PulseAudio'
arch=('x86_64')
url='https://github.com/Aurailus/Myxer'
license=('GPL3')
depends=('gtk3' 'pulseaudio')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'myxer.desktop')
sha512sums=('9b09abd597e8240ca263f26fbf2a71d449c017551047c8ad83f1a304934fc15fe66845248da6c09b763ec4c8dd7e5a59533e1728ca9490f8cd85d33d845e5900'
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

