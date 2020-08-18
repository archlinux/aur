# Maintainer: Alberto Sánchez Molero <alsamolero at gmail.com>

pkgname=nodejs-base16-builder-git
_gitname=base16-builder
pkgver=1.3.0.r7.d022b9d
pkgrel=1
pkgdesc="A nimble command-line tool that generates themes for your favourite programs."
arch=('i686' 'x86_64')
url="https://github.com/base16-builder/base16-builder"
license=('MIT')
makedepends=('npm' 'git')
source=(git+https://github.com/base16-builder/base16-builder.git)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "%s" "$(git describe --long --tag | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}


package() {
  cd "$srcdir/$_gitname"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_gitname@$_pkgver
}
