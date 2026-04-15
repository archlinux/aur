# Maintainer: Lukas Grumlik - Rakosn1cek
pkgname=xc-manager-git
_pkgname=xc-manager
pkgver=0.9.0.r0.g44dc239
pkgrel=1
pkgdesc="Secure command vaulting and Zsh logic engine for templating and \$BUFFER injection"
arch=('any')
url="https://github.com/Rakosn1cek/xc-manager"
license=('MIT')
depends=('zsh' 'fzf' 'curl' 'gnupg')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # This cleans up the 'v' prefix from the tag for Arch versioning standards
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"

  # 1. Install the core plugin loader
  install -Dm644 xc.plugin.zsh "$pkgdir/usr/share/zsh/plugins/$_pkgname/xc.plugin.zsh"

  # 2. Install the autoload functions
  install -d "$pkgdir/usr/share/zsh/plugins/$_pkgname/autoload"
  install -m644 autoload/* "$pkgdir/usr/share/zsh/plugins/$_pkgname/autoload/"

  # 3. Install Documentation & License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
