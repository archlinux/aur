# Maintainer: Mateus Lacerda <mlacerdam.ai@gmail.com>
pkgname=term_planner
pkgver=2.0.1
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
  '670d83d38c00f82488e6a70fd161a13cce60c13d32d713c429b19594d0f75b3b'
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

