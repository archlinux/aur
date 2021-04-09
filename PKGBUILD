# Maintainer: lmartinez-mirror
# Contributor: Grigorii Horos <horosgrisa@gmail.com>
pkgname=zpm-git
pkgver=r1151.205c1f2
pkgrel=1
pkgdesc="A plugin manager for zsh"
arch=('any')
url="https://github.com/horosgrisa/zpm"
license=('LGPL3')
depends=('zsh')
makedepends=('git')
install="$pkgname.install"
replaces=('zpm')
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
