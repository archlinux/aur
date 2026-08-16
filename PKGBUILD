# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=nautilus-custom-icon-name
pkgver=0.5.1
pkgrel=1
pkgdesc="A Nautilus-python extension that enables setting custom folder icons using a theme-aware icon name"
arch=('any')
url="https://gitlab.com/benleppke/nautilus-custom-icon-name"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libnotify'
  'nautilus-python'
)
optdepends=(
  'adwaita-icon-theme: fallback theme if Papirus is not installed'
  'paprius-icon-theme: Papirus folder icons'
  'papirus-folder-icons: extra folder icons for the Papirus theme'
)
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('9e25afc5fbbde39e86019e0cc3e5d8f7919075013baa734fc0e197c4891a3cb5')

package() {
  cd "$pkgname-v$pkgver"
  install -Dm644 custom_icon_name_extension.py -t \
    "$pkgdir/usr/share/nautilus-python/extensions/"
  cp -a custom_icon_name "$pkgdir/usr/share/nautilus-python/extensions/"

  for mo in po/*/LC_MESSAGES/custom-icon-name.mo; do
    lang=$(basename "$(dirname "$(dirname "$mo")")")
    install -Dm644 "${mo}" -t "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/"
  done
}
