# Maintainer: Mateus Lacerda <mlacerdam.ai@gmail.com>
pkgname=term_planner
pkgver=0.1.4
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
  '21f8f5da47156e28b867c5761d0b0075c524c8a21cfdd7d1556c1312e4395fed'
  'SKIP'
  'SKIP'
  'SKIP'
)

build() {
  cd "$srcdir/term_planner-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "$srcdir/term_planner-${pkgver}"

  install -Dm755 "target/release/term_planner" \
                "$pkgdir/usr/bin/term_planner"

  install -Dm644 systemd/term_planner-notify.service \
                "$pkgdir/usr/lib/systemd/user/term_planner-notify.service"
  install -Dm644 systemd/term_planner-notify.timer \
                "$pkgdir/usr/lib/systemd/user/term_planner-notify.timer"
}

