# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmkeys
pkgver=0.1
pkgrel=1
pkgdesc="WindowMaker dock app for switching X keymaps"
arch=('i686' 'x86_64')
url="http://www.dockapps.net/${pkgname}"
license=("GPL")
depends=('libxpm')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('5ccde04da98c7f41f0f7873a5617b5ee')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i -e 's,void main,int main,;s,getline,mygetline,' wmkeys.c
  sed -i -e 's,INLINE inline,INLINE,;t' wmgeneral/list.h
}

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm0755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
