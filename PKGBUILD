#!/usr/bin/env bash
# Maintainer: Rob Shinn <rob.shinn@gmail.com> 

pkgname=shipper
pkgver=1.21
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
source=("https://gitlab.com/esr/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('72770114cc925f95eb1c3b024d163e2489957bd456f4077b45ab387394059640')
pkgver() { 
  cd "${srcdir}/${pkgname}-${pkgver}"
  grep '^shipper_version' ${pkgname} | awk '{ print $3 }' | sed 's/"//g'
}

build() { 
  cd "${srcdir}/${pkgname}-${pkgver}"
  make all
}

package() {  
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" prefix=/usr make install
}


