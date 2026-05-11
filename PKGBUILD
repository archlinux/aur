# Maintainer: Lukas Grumlik - Rakosn1cek <https://github.com/Rakosn1cek>
pkgname=zsh-mend-git
pkgver=0.8.1
pkgrel=1
pkgdesc="A distro-agnostic system recovery and hardware assistant for Zsh"
arch=('any')
url="https://github.com/Rakosn1cek/mend"
license=('MIT')
depends=('zsh' 'fzf' 'pciutils' 'util-linux' 'grep' 'sed' 'awk')
optdepends=('pacman-contrib: for advanced package/cache management' 'sudo: required for installing packages and system repairs')
makedepends=('git')
provides=('zsh-mend')
conflicts=('zsh-mend')
source=("git+https://github.com/Rakosn1cek/mend.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/mend"

  # Install the main plugin file
  install -Dm644 mend.plugin.zsh "$pkgdir/usr/share/zsh/plugins/mend/mend.plugin.zsh"

  # Install the function modules (mend and history)
  install -d "$pkgdir/usr/share/zsh/plugins/mend/functions"
  install -m644 functions/* "$pkgdir/usr/share/zsh/plugins/mend/functions/"

  # Install the hardware library
  install -d "$pkgdir/usr/share/zsh/plugins/mend/lib"
  install -m644 lib/hardware.zsh "$pkgdir/usr/share/zsh/plugins/mend/lib/hardware.zsh"

  # Install the hardware database
  install -d "$pkgdir/usr/share/zsh/plugins/mend/data"
  install -m644 data/hardware.db "$pkgdir/usr/share/zsh/plugins/mend/data/hardware.db"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/mend/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/mend/CHANGELOG.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/doc/mend/LICENSE"
}
