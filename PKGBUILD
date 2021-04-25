# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>
pkgname=zpm-git
pkgver=r1153.a9c89bc
pkgrel=2
pkgdesc="A plugin manager for zsh"
arch=('any')
url="https://github.com/horosgrisa/zpm"
license=('LGPL3')
depends=('zsh')
optdepends=('parallel: Parallel execution'
            'rush: Parallel execution')
makedepends=('git')
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver()  {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  find bin functions lib plugins zpm.zsh \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/zpm/{}" \;
  install -Dm 644 zshrc "$pkgdir/usr/share/zpm/zshrc-example.zsh"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
