# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: icepie <icepie.dev@gmail.com>
pkgname=gnome-randr-rust
pkgver=0.1.1
pkgrel=1
epoch=1
pkgdesc="\`xrandr\` for GNOME/Wayland, on distros that don't support \`wlr-randr\`"
arch=('x86_64')
url="https://github.com/maxwellainatchi/gnome-randr-rust"
license=('MIT')
depends=('dbus')
makedepends=('cargo')
provides=("${pkgname%-rust}")
conflicts=("${pkgname%-rust}")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b50626801b98d48149ac605933e7edb8a6fb233626d75b319c7e85d2000ab64d')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/${pkgname%-rust}" -t "$pkgdir/usr/bin/"
}
