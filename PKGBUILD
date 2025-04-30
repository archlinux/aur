# Maintainer: n0n1m
pkgname=qw-git
pkgver=0.1.1
pkgrel=1
pkgdesc="Terminal text editor with vim-like keybindings"
arch=('any')
url="https://github.com/bleudev/qw"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
provides=('qw')

build() {
  cd $pkgname
  npm install
  npm run build
}

package() {
  mkdir -p $pkgdir/usr/share $pkgdir/usr/bin
  cp -r $pkgname/dist $pkgdir/usr/share/qw
  cp -r $pkgname/node_modules $pkgdir/usr/share/qw
  chmod +x $pkgdir/usr/share/qw/cli.js
  ln -s /usr/share/qw/cli.js $pkgdir/usr/bin/qw
}
