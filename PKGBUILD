# Maintainer: Tom Wadley <tom@tomwadley.net>

pkgname=nvm-git
pkgver=0.24.0.r2.g2b63f37
pkgrel=1
pkgdesc="Simple bash script to manage multiple active node.js versions (git sources)"
url="https://github.com/creationix/nvm"
arch=('any')
license=('MIT')
optdepends=('bash: bash completion')
makedepends=('git')
conflicts=('nvm')
provides=('nvm')
install="${pkgname}.install"
source=("$pkgname::git+https://github.com/creationix/nvm.git"
        "init-nvm.sh")
md5sums=('SKIP'
         '359e7cff11f9053a1d380272591d29f3')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "${srcdir}"

  # convenience script
  install -Dm644 init-nvm.sh "$pkgdir/usr/share/nvm/init-nvm.sh"

  cd "${pkgname}"

  # nvm.sh
  install -Dm644 nvm.sh "$pkgdir/usr/share/nvm/nvm.sh"

  # bash completion
  install -Dm644 bash_completion "$pkgdir/usr/share/nvm/bash_completion"

  # license
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/nvm/LICENSE.md"
}

# vim:set ts=2 sw=2 et:
