#!/usr/bin/env bash
# Maintainer: Rob Shinn <rob.shinn@gmail.com> 

pkgname=shipper-git
pkgver=1.19.r18.g96f3e42
pkgrel=1
pkgdesc='Automated shipping of open-source project releases'
provides=('shipper')
conflicts=('shipper')
arch=('any')
license=('BSD2')
url="http://www.catb.org/~esr/shipper"
makedepends=('gzip' 'xmlto' 'make')
depends=('python3' 'openssh')
optdepends=(
  'irker: post to IRC'
  'lftp: upload files via ftp or scp'
  'python-twython: post to Twitter'
)
source=("${pkgname}::git+https://gitlab.com/esr/shipper")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() { 
  cd "${srcdir}/${pkgname}"
  make all
}

package() {  
  cd "${srcdir}/${pkgname}"
  DESTDIR="$pkgdir" prefix=/usr make install
}


