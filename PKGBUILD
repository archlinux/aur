# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=linux-test-project
pkgver=20170516
pkgrel=1
pkgdesc="A collection of tools for testing the Linux kernel and related features"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://linux-test-project.github.io/"
depends=('acl' 'bash' 'gawk' 'libcap' 'libtirpc' 'python2')
source=("https://github.com/linux-test-project/ltp/releases/download/$pkgver/ltp-full-$pkgver.tar.bz2")
md5sums=('12e2d693e73acbfe7e04a7be176a26ff')

prepare() {
  cd "$srcdir/ltp-full-$pkgver"
  find . -type f -exec sed -i 's|^#!.*python$|#!/usr/bin/env python2|' '{}' ';'
}

build() {
  cd "$srcdir/ltp-full-$pkgver"

  ./configure --mandir=/usr/share/man --with-bash
  make all
}

package() {
  cd "$srcdir/ltp-full-$pkgver"

  make DESTDIR="$pkgdir" install
}

