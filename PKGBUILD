# Maintainer: Peter Cai <peter at typeblog dot net>

pkgname=gtop
pkgver=0.1.4
pkgrel=1
pkgdesc='System monitoring dashboard for terminal.'
arch=('any')
url='https://github.com/aksakalli/gtop'
license=('MIT')
depends=(
  'nodejs'
)
makedepends=(
  'npm'
)

source=(
  "https://github.com/aksakalli/gtop/archive/v${pkgver}.tar.gz"
)
md5sums=('78bf87051bb64b7f56c2d8d355431aa1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install --production
}

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules"
  mkdir -p "$_npmdir"
  cp -R "$srcdir/$pkgname-$pkgver" "$_npmdir/gtop"
  local _bindir="$pkgdir/usr/bin"
  mkdir -p "$_bindir"
  ln -s /usr/lib/node_modules/gtop/bin/gtop "$_bindir/gtop"
}
