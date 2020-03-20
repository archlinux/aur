# Maintainer: Tom Wadley <tom@tomwadley.net>

pkgname=nvm-git
pkgver=0.35.3.r1.gf607f2f
pkgrel=1
pkgdesc="Node Version Manager - Simple bash script to manage multiple active node.js versions (git sources)"
url="https://github.com/nvm-sh/nvm"
arch=('any')
license=('MIT')
optdepends=('bash: bash completion')
makedepends=('git')
conflicts=('nvm')
provides=('nvm')
install="${pkgname}.install"
source=("$pkgname::git+https://github.com/nvm-sh/nvm.git"
        "init-nvm.sh"
        "install-nvm-exec")
sha256sums=('SKIP'
            '692317bfd036557f59543fef9b67ff38de68208d30361fe385291f58d3ac0425'
            '795d3f6ad3076aa4b0bb9cc48a2e6e79331d121278a887667fb707181a54a10b')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "${srcdir}"

  # convenience script
  install -Dm644 init-nvm.sh "$pkgdir/usr/share/nvm/init-nvm.sh"

  # companion script which installs symlinks in NVM_DIR (see comment in script)
  install -Dm644 install-nvm-exec "$pkgdir/usr/share/nvm/install-nvm-exec"

  cd "${pkgname}"

  # nvm itself
  install -Dm644 nvm.sh "$pkgdir/usr/share/nvm/nvm.sh"

  # nvm-exec script for 'nvm exec' command
  install -Dm755 nvm-exec "$pkgdir/usr/share/nvm/nvm-exec"

  # bash completion
  install -Dm644 bash_completion "$pkgdir/usr/share/nvm/bash_completion"

  # license
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/nvm/LICENSE.md"
}

# vim:set ts=2 sw=2 et:
