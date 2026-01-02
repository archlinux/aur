# Maintainer: ruxir-ig <ruchirkalokhe@gmail.com.com>
# Contributor: unxsh (original author)

pkgname=('nitch-git' 'nitch-git-nonerd')
pkgver=0.0.0.r0
pkgrel=1
pkgdesc="Incredibly fast system fetch written in Nim (git snapshot)"
arch=('x86_64')
url="https://github.com/ruxir-ig/nitch"
license=('MIT')
depends=()
makedepends=('nim' 'nimble' 'git')
source=("git+https://github.com/ruxir-ig/nitch.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/nitch"
  printf "0.0.0.r%s" "$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/nitch"

  # Build Nerd Font version
  nimble build -d:release -y

  # Build Non-Nerd Font version
  nim c -d:release -o:nitchNoNerd src/nitchNoNerd.nim
}

package_nitch-git() {
  pkgdesc="Incredibly fast system fetch written in Nim (Nerd Font icons)"
  optdepends=('nerd-fonts: for icon support')

  cd "$srcdir/nitch"
  install -Dm755 nitch "$pkgdir/usr/bin/nitch"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_nitch-git-nonerd() {
  pkgdesc="Incredibly fast system fetch written in Nim (no Nerd Font icons)"
  conflicts=('nitch')
  provides=('nitch')

  cd "$srcdir/nitch"
  install -Dm755 nitchNoNerd "$pkgdir/usr/bin/nitch"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
