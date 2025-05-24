# Maintainer: Mateus Lacerda <mlacerdam.ai@gmail.com>
pkgname=term_planner
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple planner with dunst based notifications"
arch=('x86_64')
url="https://github.com/Mateus-Lacerda/term_planner"
license=('MIT')
depends=('glibc')
makedepends=('rust' 'cargo')
optdepends=('dunst: notificador via notify-send para Dunst')

source=(
  "term_planner-${pkgver}.tar.gz::https://github.com/Mateus-Lacerda/term_planner/archive/refs/tags/v${pkgver}.tar.gz"
  "term_planner-notify.service"
  "term_planner-notify.timer"
  "LICENSE"
)
noextract=('*.tar.gz')
sha256sums=(
  '16175f3c0b83dd6e4e0fc4f9520de9f556eb8a8a63e43f62b068da4a2ef76398'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

build() {
  cd "$srcdir/term_planner"
  cargo build --release --locked
}

package() {
  cd "$srcdir/term_planner"

  install -Dm755 "target/release/term_planner" \
                "$pkgdir/usr/bin/term_planner"

  install -Dm644 term_planner-notify.service \
                "$pkgdir/usr/lib/systemd/user/term_planner-notify.service"
  install -Dm644 term_planner-notify.timer \
                "$pkgdir/usr/lib/systemd/user/term_planner-notify.timer"
}

