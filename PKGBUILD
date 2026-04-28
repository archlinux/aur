# Maintainer: Scott Jones <scottajones@gmail.com>
pkgname=omarchy-emacs
pkgver=1.8.5
pkgrel=1
pkgdesc="Emacs integration for Omarchy with automatic theme and font syncing"
arch=('any')
url="https://github.com/scottjones/omarchy-emacs"
license=('MIT')
depends=('emacs-wayland' 'bash')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('81079d06506a0ec900cf82c33380a1de197f29c1a51cbfd4f619aac2b388d3d9')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install config files
  install -dm755 "$pkgdir/usr/share/omarchy-emacs/config/themes"
  install -Dm644 config/init.el "$pkgdir/usr/share/omarchy-emacs/config/init.el"
  install -Dm644 config/omarchy.el "$pkgdir/usr/share/omarchy-emacs/config/omarchy.el"
  install -Dm644 config/shell-bashrc "$pkgdir/usr/share/omarchy-emacs/config/shell-bashrc"
  install -Dm644 config/themes/omarchy-theme.el "$pkgdir/usr/share/omarchy-emacs/config/themes/omarchy-theme.el"

  # Install color template
  install -Dm644 omarchy-colors.el.tpl "$pkgdir/usr/share/omarchy-emacs/omarchy-colors.el.tpl"

  # Install hooks
  install -Dm755 hooks/font-set "$pkgdir/usr/share/omarchy-emacs/hooks/font-set"

  # Install bin scripts to PATH
  install -Dm755 bin/omarchy-emacs-setup "$pkgdir/usr/bin/omarchy-emacs-setup"
  install -Dm755 bin/omarchy-restart-emacs "$pkgdir/usr/bin/omarchy-restart-emacs"
  install -Dm755 bin/omarchy-install-emacs "$pkgdir/usr/bin/omarchy-install-emacs"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
