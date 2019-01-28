# Maintainer: Arnoud Willemsen <mail at lynthium dot com>

pkgname=jdupes-git
pkgver=1.11.1+18+g8b65531
pkgrel=1
pkgdesc="jdupes is a program for identifying duplicate files residing within specified directories"
arch=('i686' 'x86_64')
url="https://github.com/jbruchon/jdupes/"
license=('MIT')
depends=('glibc')
provides=('jdupes')
conflicts=('jdupes')
source=("${pkgname}::git+https://github.com/jbruchon/jdupes.git"
        "LICENSE")
sha256sums=('SKIP'
            'ff95e2262ce1dd788e66c6c8763354e350a46044b8532d92146b7b03a319481a')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long | sed 's/-/+/g; s/^v//'
}

build() {
  cd "${srcdir}/${pkgname}"
  make ENABLE_BTRFS=1
}

package(){
  cd "${srcdir}/${pkgname}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim: set ts=2 sw=2 et:
