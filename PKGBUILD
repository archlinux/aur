#!/bin/bash

# Maintainer: Hao Zhang <hzhangxyz@outlook.com>

pkgname=fire-hpp-git
_pkgname="${pkgname%*-git}"
pkgver=r154.8753e2b
pkgrel=1
pkgdesc="Fire for C++"
arch=('any')
url="https://github.com/kongaskristjan/$_pkgname"
license=('Boost Software License')

source=(
    "git+$url.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
          printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    install -d "$pkgdir/usr/include"
    cp $srcdir/$_pkgname/include/fire-hpp/fire.hpp $pkgdir/usr/include
}
