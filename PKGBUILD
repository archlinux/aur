# Maintainer: kso <keansum AT gmail DOT com>

pkgname=lest-git
_pkgname=lest
pkgver=1.31.0.r7.gf4874cc
pkgrel=1
pkgdesc='Modern, C++11, single header, tiny framework for unit-tests, TDD and BDD'
arch=('x86_64')
url='https://github.com/martinmoene/lest'
license=('Boost')
makedepends=('git')
source=("git+https://github.com/martinmoene/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  # v1.31.0-7-gf4874cc
  # to
  # 1.31.0.r7.gf4874cc
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  # install headers
  echo "pkgdir=$pkgdir"

  echo "srcdir=$srcdir"

  # loop through to install with permissions rw-r--r--
  # lest_basic.hpp
  # lest_cpp03.hpp
  # lest_decompose.hpp
  # lest.hpp
  for file in $srcdir/lest/include/lest/*; do
    echo "file = $file"
    install -D -m644 $file $pkgdir/usr/include/lest/$(basename $file)
  done

  # install LICENSE
  install -D -m644 $srcdir/$_pkgname/LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
