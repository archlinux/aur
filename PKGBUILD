# Maintainer: Sergius <sergius AT sarbs DOT xyz>

_gitname=rofi-pass
pkgname=sarbs-rofi-pass-git
pkgver=2024.06.16.r555.g37c4c86
pkgrel=1
pkgdesc="Rofi-Oberfläche für den Passwortmanager pass (temporär Upstream, eigenes SARBS-Skript folgt)"
arch=('any')
url="https://github.com/carnager/rofi-pass"
license=('GPL-3.0-or-later')
depends=('bash' 'pass' 'rofi' 'xdotool' 'xclip' 'gawk' 'pwgen')
optdepends=('pass-otp: OTP-Unterstützung'
            'wtype: Tastatureingaben unter Wayland'
            'wl-clipboard: Zwischenablage unter Wayland'
            'python: KeePass-Import- und CSV-Skripte')
makedepends=('git')
provides=('rofi-pass')
conflicts=('rofi-pass')
backup=('etc/rofi-pass.conf')
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
