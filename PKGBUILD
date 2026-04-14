# Maintainer: kaathe <primordial.serpent.darkstalker.kaathe at proton dot me>
_pkgname=tmux-resurrect
pkgname=tmux-resurrect-git
pkgver=r306.cff343c
pkgrel=1
pkgdesc="Persist tmux environment across system restarts."
arch=('any')
url='https://github.com/tmux-plugins/tmux-resurrect'
install=tmux-resurrect.install
license=('MIT')
depends=('tmux' 'bash')
optdepends=('expect: restore.exp script that fully restores tmux environment')
makedepends=('git')
provides=('tmux-resurrect')
conflicts=('tmux-resurrect')
source=("${pkgname}::git+https://github.com/tmux-plugins/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed 's|~/.tmux/plugins/tmux-resurrect|/usr/share/tmux-resurrect-git|' -i scripts/restore.exp
}

package() {
  cd "$srcdir/$pkgname"

  local destdir="$pkgdir/usr/share/$_pkgname"
  install -d "$destdir"
  cp -r lib save_command_strategies scripts strategies *.tmux "$destdir/"

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
