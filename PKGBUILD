# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: jiangxq <jiangxueqian at gmail dot com>
# Contributor: zh99998 <zh99998@gmail.com>
# Contributor: 4679kun <admin at 4679 dot us>

pkgname=simple-obfs-git
pkgver=v0.0.5.r39.g5cbfdcc
pkgrel=1
pkgdesc='A simple obfusacting tool designed as plugin server of shadowsocks (git version)'
arch=('x86_64')
url='https://github.com/shadowsocks/simple-obfs'
license=('GPL')
depends=('libev' 'libcork')
makedepends=('asciidoc' 'xmlto')
conflicts=('simple-obfs')
source=("$pkgname::git+https://github.com/shadowsocks/simple-obfs.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --tags | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd $pkgname
  
  patch -p1 -i debian/patches/0001-Use-libcork-dev-in-system.patch
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
