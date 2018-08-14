# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=linux-test-project
pkgver=20180515
pkgrel=1
pkgdesc="A collection of tools for testing the Linux kernel and related features"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://linux-test-project.github.io/"
depends=('acl' 'bash' 'gawk' 'libcap' 'libtirpc' 'python2' 'libaio' 'numactl')
source=("https://github.com/linux-test-project/ltp/releases/download/$pkgver/ltp-full-$pkgver.tar.bz2")
md5sums=('e104b70ae4b0d7f7e728ef5345242d2c')

prepare() {
  cd "$srcdir/ltp-full-$pkgver"

  find . -type f -exec sed -i 's|^#!.*python$|#!/usr/bin/env python2|' '{}' ';'
  ./configure --mandir=/usr/share/man --with-bash
}

build() {
  cd "$srcdir/ltp-full-$pkgver"

  make all
}

package() {
  cd "$srcdir/ltp-full-$pkgver"

  make DESTDIR="$pkgdir" install
}

