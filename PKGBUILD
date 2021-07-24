# Maintainer: Akatsuki Rui <akiirui@outlook.com>

pkgname="mpv-handler"
pkgver=0.2.4
pkgrel=1
pkgdesc="Play website videos and songs with mpv & youtube-dl."
arch=("x86_64")
depends=("mpv" "youtube-dl")
makedepends=("cargo" "git")
url="https://github.com/akiirui/mpv-handler/"
license=("MIT")
install=mpv-handler.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/akiirui/mpv-handler/archive/v$pkgver.tar.gz")
b2sums=('615dbd76a3cb834fcd60639d908672352fc7978642ba1eacb1eb351b43343740296393859e65026d1687f5aa866d689246916ff8074256f332f6f90f1e14fdd5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --locked --release --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/mpv-handler" "$pkgdir/usr/bin/mpv-handler"
  install -Dm644 "share/mpv-handler.toml" "$pkgdir/usr/share/mpv-handler/mpv-handler.toml"
  install -Dm644 "share/linux/mpv-handler.desktop" "$pkgdir/usr/share/applications/mpv-handler.desktop"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
