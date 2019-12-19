# Maintainer: Amirali Esmaeili <esmailiamirali at gmail dot com>

pkgname=clio-lang
pkgver=0.1.6
pkgrel=1
pkgdesc="a pure functional lazy-evaluated programming language"
arch=('any')
url="https://clio-lang.org"
license=('APACHE')
depends=('nodejs')
makedepends=('npm' 'git')
source=("git+https://github.com/clio-lang/clio.git#commit=c045625")
sha256sums=('SKIP')

build() {
  cd clio
  npm install --production
}

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules"
  mkdir -p "$_npmdir"/clio-lang
  cp -R clio/* "$_npmdir/clio-lang"
  local _bindir="$pkgdir/usr/bin"
  mkdir -p "$_bindir"
  ln -s /usr/lib/node_modules/clio-lang/cli/index.js "$_bindir/clio"

  install -Dm644 clio/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
