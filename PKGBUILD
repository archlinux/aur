# Contributor: Jordan Wade <jordan@jwade.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lua-yaml-git
pkgver=5.1.4.5.g0fb4475
pkgrel=1
pkgdesc="Lua bindings for YAML using the LibYAML library"
arch=('i686' 'x86_64')
url="http://yaml.luaforge.net/"
license=('MIT' 'custom')
depends=('lua' 'libyaml' 'specl')
# URL doesn't change predictably with version number, so it's hardcoded
source=(lua-yaml::git+https://github.com/gvvaughan/lyaml.git)
md5sums=('SKIP')
options=(!'makeflags')

pkgver() {
  cd "lua-yaml"
  git describe --tags | sed 's|-|.|g' | cut -c2-
}

prepare() {
  cd "lua-yaml"
  sed -i '32,37d' bootstrap.conf
}

build() {
  cd "lua-yaml"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "lua-yaml"
  make DESTDIR=$pkgdir install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/lua-yaml-git/COPYING
}
