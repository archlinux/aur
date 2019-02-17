# Maintainer: Jan Koppe <post@jankoppe.de>
pkgname=clustergit-git
pkgver=r135.0d94db9
pkgrel=1
pkgdesc="run git commands on multiple git clones "
arch=('any')
url="https://github.com/mnagel/clustergit"
license=('custom')
depends=('python' 'git')
makedepends=('git')
source=('clustergit::git+https://github.com/mnagel/clustergit')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  sed -ne '/## License/,$ p' README.md > LICENSE
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 clustergit "$pkgdir/usr/bin/clustergit"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
