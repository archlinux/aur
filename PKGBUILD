# Maintainer: Mateus Lacerda <mlacerdam.ai@gmail.com>
pkgname=term_planner
pkgver=0.1.3
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
  '5711f60bc8a15a1d113f97c5788ac0c013ef1a99262ad5e7c5228a3cc340b75b'
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

