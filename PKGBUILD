# Maintainer: F43nd1r <support@faendir.com>

pkgname=telegram-notifier-git
pkgver=r3.683710a
pkgrel=1
pkgdesc="Notify a Telegram chat when a systemd unit fails"
arch=(any)
url="https://github.com/CurrySoftware/Telegram-Notifier"
license=(MIT)
depends=(bash curl systemd)
makedepends=(git)
provides=(telegram-notifier)
conflicts=(telegram-notifier)
backup=(etc/telegram/key.sh)
source=("telegram-notifier::git+https://github.com/CurrySoftware/Telegram-Notifier.git")
sha256sums=(SKIP)

pkgver() {
  cd telegram-notifier
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd telegram-notifier

  install -Dm755 usr/bin/telegram "$pkgdir/usr/bin/telegram"
  install -Dm755 usr/bin/unit-status-telegram "$pkgdir/usr/bin/unit-status-telegram"
  install -Dm644 etc/systemd/system/unit-status-telegram@.service \
    "$pkgdir/usr/lib/systemd/system/unit-status-telegram@.service"
  install -Dm600 etc/telegram/key.sh "$pkgdir/etc/telegram/key.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
