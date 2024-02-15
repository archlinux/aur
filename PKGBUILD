# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=huxdemp-git
_pkgname=huxdemp
_luaver=5.4
pkgver=1.0.0.r5.g18e1535
pkgrel=1
pkgdesc='Highly advanced and colored version of hexdump.'
arch=('x86_64' 'aarch64')
url='https://github.com/kiedtl/huxdemp'
license=('GPL-3.0-or-later')
depends=('less')
makedepends=('git' 'lua' 'scdoc')
conflicts=('huxdemp')
source=("git+https://github.com/kiedtl/$_pkgname.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname

  LUA="lua$_luaver" LUALIB="lua$_luaver" PREFIX=/usr make
}

package() {
  cd $_pkgname

  install -dm 755 "$pkgdir/usr/share/man/man1/"

  make PREFIX=/usr DESTDIR="$pkgdir" install

  ln -s "/usr/bin/huxd" "$pkgdir/usr/bin/$_pkgname"

  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" *.md
}