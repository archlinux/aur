# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Yamashita Ren <lemaitre.lotus@gmail.com>

pkgname=dcadec-git
pkgver=r207.2a9186e
pkgrel=1
pkgdesc='DTS Coherent Acoustics decoder with support for HD extensions'
arch=('i686' 'x86_64')
url='https://github.com/foo86/dcadec.git'
license=('LGPL2.1')
depends=('glibc')
provides=('dcadec')
makedepends=('git')
source=('git://github.com/foo86/dcadec.git')
md5sums=('SKIP')

pkgver() {
  cd dcadec

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd dcadec

  export CONFIG_SHARED='TRUE'

  make
}

package() {
  cd dcadec

  export CONFIG_SHARED='TRUE'
  export PREFIX='/usr'

  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/usr/bin/{dcadec,dcahddec}
}

# vim: ts=2 sw=2 et:
