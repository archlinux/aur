# Maintainer: Sergius <sergius AT sarbs DOT xyz>

_gitname=mutt-wizzard-de
pkgname=sarbs-mutt-wizzard-de-git
pkgver=2026.08.22.r16.gc9b2dba
pkgrel=1
pkgdesc="Automatisierte Neomutt-Konfiguration mit IMAP/SMTP – deutsche Version von mutt-wizard (Teil von SARBS)"
arch=('any')
url="https://codeberg.org/Sergius/mutt-wizzard-de"
license=('GPL-3.0-or-later')
depends=('bash' 'neomutt' 'isync' 'msmtp' 'pass' 'curl' 'ca-certificates' 'gettext')
optdepends=('goimapnotify: Push-Benachrichtigungen für neue Mails'
            'lynx: HTML-Mails im Terminal anzeigen'
            'notmuch: Mails durchsuchen und indizieren'
            'abook: Adressbuch'
            'urlview: URLs aus Mails extrahieren'
            'cronie: automatische Synchronisation per Cronjob'
            'mpop: POP3-Unterstützung'
            'bogofilter: SPAM-Filter')
makedepends=('git')
provides=('mutt-wizard')
conflicts=('mutt-wizard')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "%s.r%s.g%s" "$(git log -1 --format=%cd --date=format:'%Y.%m.%d')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
