# Maintainer: ShadowKyogre <shadowkyogre.public@gmail. com>

pkgname=zsh-directory-history-git
pkgver=1.1.0.r9.g7abeca2
pkgrel=1
pkgdesc="Per directory history plugin for zsh"
arch=('any')
url="https://github.com/tymm/zsh-directory-history"
license=('BSD')
depends=('zsh' 'python2')
makedepends=('git')
provides=('zsh-directory-history')
conflicts=('zsh-directory-history')
install="${pkgname}.install"
source=(
  'git+https://github.com/tymm/zsh-directory-history'
)

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  local name="${pkgname%-git}"
  cd "$srcdir/$name"
  install -d -m755 "$pkgdir/usr/share/zsh/plugins/$name"
  install -d -m755 "$pkgdir/usr/bin"
  install -m755 dirhist "$pkgdir/usr/bin"
  install -Tm644 "${name#zsh-}.plugin.zsh" "$pkgdir/usr/share/zsh/plugins/$name/$name.zsh"
  install -m644 README.md "$pkgdir/usr/share/zsh/plugins/$name"
}

# vim:set ts=2 sw=2 et:

md5sums=('SKIP')
