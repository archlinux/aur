# Maintainer: Mestik78 <mestik@example.com>
pkgname=bonsai-pomodoro-git
pkgver=0.1.0.r0.g1234567
pkgrel=1
pkgdesc="A beautiful Terminal User Interface (TUI) Pomodoro application written in Rust, inspired by Forest (Development version)."
arch=('x86_64')
url="https://github.com/Mestik78/bonsai-pomodoro"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("bonsai-pomodoro")
conflicts=("bonsai-pomodoro")
source=("git+https://github.com/Mestik78/bonsai-pomodoro.git")
sha256sums=('SKIP')

pkgver() {
  cd "bonsai-pomodoro"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "bonsai-pomodoro"
  cargo build --release --locked
}

package() {
  cd "bonsai-pomodoro"
  install -Dm755 "target/release/bonsai_pomodoro" "$pkgdir/usr/bin/bonsai-pomodoro"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
