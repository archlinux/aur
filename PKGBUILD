# Maintainer: CTech <ctech.exe@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: kevku <kevku@gmx.com>

pkgname=reaver-wps-fork-t6x-git
_pkgname=reaver-wps-fork-t6x
pkgver=1.6.5.r224.140507a
pkgrel=1
pkgdesc="reaver-wps-fork-t6x is a community forked version of reaver, which has included various bug fixes and additional attack method (the offline Pixie Dust attack)."
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/t6x/reaver-wps-fork-t6x"
license=('GPL2')
depends=('libpcap' 'pixiewps' 'aircrack-ng')
makedepends=('git')
replaces=('reaver' 'reaver-svn' 'reaver-git' 'reaver-wps-fork-t6x')
conflicts=('reaver' 'reaver-svn' 'reaver-git' 'reaver-wps-fork-t6x')
provides=('reaver')
source=("$pkgname::git+https://github.com/t6x/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//;'
}

build() {
  unset MAKEFLAGS
  cd "$pkgname/src"
  ./configure --prefix=/usr --sysconfdir=/etc
  make -j1
}

package() {
  cd "$pkgname"
  install -Dvm755 src/reaver "$pkgdir/usr/bin/reaver"
  install -Dvm755 src/wash "$pkgdir/usr/bin/wash"
  install -d "$pkgdir/etc/reaver"
  install -Dvm644 docs/README "$pkgdir/usr/share/doc/reaver/README"
  install -Dvm644 docs/reaver.1 "$pkgdir/usr/share/man/man1/reaver.1"
}

