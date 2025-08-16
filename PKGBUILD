# Maintainer: damir <sudo dot pacman at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: sandman <r.coded@gmail.com>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>

pkgname=xprobe2
pkgver=0.3
pkgrel=5
pkgdesc='Active OS fingerprinting tool'
arch=('i686' 'x86_64')
license=('GPL-2.0-only')
url='https://github.com/binarytrails/xprobe2/tree/master'
backup=('etc/xprobe2/xprobe2.conf')
depends=('libpcap')
_commit="f14af2e4f757d86b2a2acfec75c0f1768f44cecb"
source=("git+https://github.com/binarytrails/xprobe2.git#commit=$_commit")
sha512sums=('d058e1bb1ec1ece4cd56dc4d37b0b0e85b7e4af7c28a91f11b2b0feb81fc486c713d1b6b60831806def40aafb4b267555ea15cca32284f9af28603e5d66ccdaa')
            
#sha512sum of original tarball 0.3: 'fd499ada22be5df3e01630948cb72d1a9e648e0c7bfaf2a688386a61c67bb36a326a9e2f3f2b9960a6a49128343010aafe8a3f04ec05e89420a1384215e41f21'

prepare(){
  cd ${pkgname}  
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --sysconfdir=/etc
  sed -i '18a\#include <ctime>' libs-external/USI++/src/tcp.cc
  sed -i '19a\#include <ctime>' libs-external/USI++/src/datalink.cc
}

build(){
  cd ${pkgname}
  make
}

package(){
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}

