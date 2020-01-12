# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: aksr <aksr at t-com dot me>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Dan Vratil <progdan@progdansoft.com>

pkgbase=vwm
#pkgname=('vwm' 'vwm-modules-vwmterm3')
pkgname='vwm'
pkgver=3.3.2
pkgrel=1
_commit=c132fe3d67678a9acbc0ada00ad42312b099a891
pkgdesc="Viper Window Manager"
arch=('i686' 'x86_64')
url="http://www.console-craze.com/hosted-software/vwm/"
license=('GPL')
depends=('libviper>=1.4.5' 'gpm' 'libvterm-vwm' 'libconfig')
makedepends=('cmake' 'git')
source=("git+https://github.com/TragicWarrior/${pkgbase}.git#commit=${_commit}"
        "ncurses-import.patch")
sha256sums=('SKIP'
            '989e68bf68ed7756467220e4642c03bf72083c9a0fa0d59aad01571c1d9c2e3a')


prepare() {
  mkdir -p build
  patch -Np0 -i ncurses-import.patch
}

build() {
  cd build
  cmake ../${pkgbase} \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
  #make prefix=/usr -C modules/vwmterm3
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
