# Maintainer: Sergius <sergius AT sarbs DOT xyz>

_gitname=smb-post
pkgname=sarbs-smb-post-git
pkgver=2026.06.10.r5.g147f86b
pkgrel=1
pkgdesc="Minimalistischer, tastaturgesteuerter Serienbrief-Verteiler für Unix-Systeme"
arch=('any')
url="https://codeberg.org/Sergius/smb-post"
license=('MIT')
depends=('bash' 'rofi' 'jq' 'libnotify')
optdepends=('msmtp: Mail-Backend'
            'sendmail: Mail-Backend')
makedepends=('git')
provides=("smb-post=$pkgver")
conflicts=('smb-post')
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
