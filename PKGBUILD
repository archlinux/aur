# Maintainer: Winux <winux@winux.cc>


pkgname=gv-usb2-driver-dkms-git
pkgver=r35.7423642
_pkgname=GV-USB2-Driver
pkgrel=1
pkgdesc="A linux driver for the IO-DATA GV-USB2 SD capture device. (DKMS)"
arch=(any)
url="https://github.com/jkl1337/GV-USB2-Driver"
license=('Dual BSD/GPL')
depends=('dkms')
makedepends=('git')
source=("$_pkgname::git+$url"
        "dkms.conf")
sha256sums=('SKIP'
            '4a975ca09412ca52642cf35d7fad38f00fa747eb357bd0485292b7f0166e54d9')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}


package() {
  mkdir -p "${pkgdir}"/usr/src/${_pkgname}-${pkgver}
  cp -a $_pkgname/{*.{h,c},Makefile,.gitignore} "${pkgdir}"/usr/src/${_pkgname}-${pkgver}
  cp dkms.conf "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/

  sed -e "s/@PKGNAME@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf
}
