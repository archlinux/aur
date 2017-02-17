# Maintainer: wangjiezhe <wangjiezhe AT yandex DOT com>
pkgname=baidupcs-git
_pkgname=BaiduPCS
pkgver=0.2.5.34.g866333b
pkgrel=1
pkgdesc="The terminal utility for Baidu Network Disk"
arch=('i686' 'x86_64')
url="https://github.com/GangZhuo/BaiduPCS"
license=('MIT')
depends=('curl' 'openssl')
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i "s|http://|https://|g;s|^inline|static inline|" pcs/pcs.c
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 bin/pcs "$pkgdir"/usr/bin/pcs
}

# vim:set ts=2 sw=2 et:
