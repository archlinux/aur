# Maintainer: ObserverOfTime <chronobserver@disroot.org>

_pkgname=yarn-completion
pkgname=yarn-completion-git
pkgver=v0.13.0.r0.g7b42496
pkgrel=1
pkgdesc='Bash completion for Yarn'
url='https://github.com/dsifford/yarn-completion'
arch=('any')
license=('MIT')
depends=('bash' 'bash-completion' 'yarn')
makedepends=('git')
source=('git+https://github.com/dsifford/yarn-completion.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  # doesn't show the latest tag (v0.13.0) without this
  declare _commit="$(git rev-list --tags --max-count=1)"
  git describe --long --tags "$_commit" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "$srcdir/$_pkgname"
  bash tests/test
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 $_pkgname.bash $pkgdir/etc/bash_completion.d/$_pkgname.bash
}

# vim:set ts=2 sw=2 et:

