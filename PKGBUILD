# Maintainer: Tobias Kunze <r@rixx.de>
# Maintained at https://github.com/rixx/pkgbuilds, feel free to submit patches

pkgname=hostmux-git
pkgver=1.1.0.r1.g9de5250
pkgrel=1
pkgdesc="A wrapper script for tmux to multiplex commands to ssh hosts"
arch=('any')
url="http://github.com/hukl/hostmux"
license=('MIT')
depends=('tmux')
makedepends=('git')
optdepends=('zsh: completion file')
source=("$pkgname::git+http://github.com/hukl/${pkgname%-*}.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  
  install -dm755 $pkgdir/usr/share 
  install -Dm644 ./man/hostmux.1 $pkgdir/usr/share/man/man1/hostmux.1
  install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/hostmux/LICENSE
  install -Dm644 ./zsh-completion/_hostmux $pkgdir/usr/share/zsh/site-functions/_hostmux

  install -Dm755  ./hostmux $pkgdir/usr/bin/hostmux
}
post_install() {
  echo "$pkgname $pkgver"
  echo "consider adding the following to your .tmuxrc:"
  echo "    # This toggles the synchronize-panes feature"
  echo "    bind-key a set-window-option synchronize-panes"
  echo "    # This allows killing the whole session with a simple short cut:"
  echo "    bind-key X kill-session"
}
