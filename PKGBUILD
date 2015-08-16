# Author: fnord0 <fnord0 AT riseup DOT net>

pkgname=hurl-git
pkgver=20120714
pkgrel=1
pkgdesc="hURL is a hexadecimal & URL encoder + decoder, and does several base conversions (similar to radare's rax(2) utility)"
arch=('i686' 'x86_64')
url=("https://github.com/fnord0/hURL")
license=('GPL')
provides=('hurl')
makedepends=('git')
_gitroot=("http://github.com/fnord0/hURL.git")
_gitname=("hURL")

build() {
  cd ${srcdir}

 ## Git checkout
  if [ -d ${srcdir}/${_gitname} ] ; then
    msg "Git checkout:  Updating existing tree"
    cd ${_gitname} && git pull origin
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone ${_gitroot}
  fi
  msg "Checkout completed"

 ## Build
  rm -rf ${srcdir}/${_gitname}-build
  cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build
}
package() {
  cd ${srcdir}/${_gitname}-build
  install -d ${pkgdir}/usr/share/${_gitname} || return 1
  install -d ${pkgdir}/usr/bin || return 1
  cp -a ${srcdir}/${_gitname}-build/* \
    ${pkgdir}/usr/share/${_gitname} || return 1
  ln -s /usr/share/${_gitname}/hURL \
    ${pkgdir}/usr/bin/hURL || return 1
  install -Dm644 README \
    ${pkgdir}/usr/share/${_gitname}/README
}
