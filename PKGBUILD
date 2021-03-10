# Maintainer: Arnoud Willemsen <mail at lynthium dot com>

pkgname=jdupes-git
pkgver=1.19.1+12+gd583576
pkgrel=1
pkgdesc="Is a program for identifying duplicate files residing within specified directories"
arch=('i686' 'x86_64')
url="https://github.com/jbruchon/jdupes"
license=('MIT')
depends=('glibc')
provides=('jdupes')
conflicts=('jdupes')
source=("${pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long | sed 's/-/+/g; s/^v//'
}

build() {
  cd "${srcdir}/${pkgname}"
  make ENABLE_BTRFS=1 ENABLE_DEDUPE=1 STATIC_DEDUPE_H=1
}

package(){
  cd "${srcdir}/${pkgname}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim: set ts=2 sw=2 et:
