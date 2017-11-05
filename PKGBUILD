# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=linux-test-project-git
pkgver=20170929.r163.gdb141701d
pkgrel=1
pkgdesc="A collection of tools for testing the Linux kernel and related features"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://linux-test-project.github.io/"
depends=('acl' 'bash' 'gawk' 'libcap' 'libtirpc' 'python2' 'numactl')
source=("git+https://github.com/linux-test-project/ltp.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ltp"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/ltp"
  find . -type f -exec sed -i 's|^#!.*python$|#!/usr/bin/env python2|' '{}' ';'
}

build() {
  cd "$srcdir/ltp"

  make autotools
  ./configure --prefix=/usr/share --mandir=/usr/share/man --with-bash 
  make all
}

package() {
  cd "$srcdir/ltp"

  make DESTDIR="$pkgdir" install
}

