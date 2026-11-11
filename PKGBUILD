# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=nautilus-custom-icon-name
pkgver=0.6.3
pkgrel=2
pkgdesc="A Nautilus-python extension that enables setting custom folder icons using a theme-aware icon name"
arch=('any')
url="https://gitlab.com/benleppke/nautilus-custom-icon-name"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libnotify'
  'nautilus-python'
  'python-gobject'
)
optdepends=(
  # 'gnome-shell-extension-accent-directories: Sync folder icons to the GNOME accent color'  ## TODO
  'papirus-icon-theme: Papirus folder icons'
  'papirus-folder-icons: extra folder icons for the Papirus theme'
)
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('7b6d08d48399b71643d24d334bbf88e03daafd2ebc7815a85711c66dbb1989bc')

package() {
  cd "$pkgname-v$pkgver"
  install -Dm644 custom_icon_name_extension.py -t \
    "$pkgdir/usr/share/nautilus-python/extensions/"
  cp -a custom_icon_name "$pkgdir/usr/share/nautilus-python/extensions/"

  for mo in po/*/LC_MESSAGES/custom-icon-name.mo; do
    lang=$(basename "$(dirname "$(dirname "$mo")")")
    install -Dm644 "${mo}" -t "$pkgdir/usr/share/locale/${lang}/LC_MESSAGES/"
  done
}
