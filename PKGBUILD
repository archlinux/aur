# Maintainer: mnUX7APWYTJ4 <x4mP9QeT7uA2bR0cV1n@proton.me>
pkgname=yandexmusicmodpatcher
pkgver=0.7.6
pkgrel=1
pkgdesc="Patcher for YandexMusicModClient (repackage from official .deb)"
arch=('x86_64')
url="https://github.com/TheKing-OfTime/YandexMusicModPatcher"
license=('MIT')

depends=(
  'glib2'
  'gtk3'
  'gvfs'
  'hicolor-icon-theme'
  'kde-cli-tools'
  'libdrm'
  'libnotify'
  'libxcb'
  'mesa'
  'nss'
  'trash-cli'
  'xdg-utils'
)

optdepends=(
  'apparmor: AppArmor support'
  'libgnome-keyring: GNOME keyring integration'
  'pulseaudio: Audio support'
)

source=(
  "yandexmusicmodpatcher_${pkgver}_amd64.deb::https://github.com/TheKing-OfTime/YandexMusicModPatcher/releases/download/v${pkgver}/yandexmusicmodpatcher_${pkgver}_amd64.deb"
)

sha256sums=('SKIP')

package() {
  cd "$srcdir"

  bsdtar -xf "yandexmusicmodpatcher_${pkgver}_amd64.deb"

  bsdtar -xf data.tar.*

  cp -a usr "$pkgdir/"
  cp -a opt "$pkgdir/" 2>/dev/null || true
}

post_install() {
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor || true
  update-desktop-database -q || true
}

post_upgrade() {
  post_install
}

post_remove() {
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor || true
  update-desktop-database -q || true
}
