# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=estilo-git
pkgver=r253.3e86a39
pkgrel=1
pkgdesc="Create and maintain colorschemes for vim, airline, and lightline"
arch=('any')
url="https://github.com/jacoborus/estilo"
license=('MIT')
depends=('bash' 'gnuplot' 'nodejs' 'perl')
makedepends=('git' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  tar czf "$pkgname-$pkgver.tar.gz" "$pkgname"
}

package() {
  npm install --cache "$srcdir/npm-cache" -g --prefix "$pkgdir/usr" "$pkgname-$pkgver.tar.gz"
  find "$pkgdir/usr" -type d -name '.git' -exec rm -rf '{}' +
  chown -R root:root "$pkgdir/"
}
