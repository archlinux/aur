# $Id$
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=procps-ng
pkgname=procps-ng-git
pkgver=3.3.11
pkgrel=42
pkgdesc='Utilities for monitoring your system and its processes'
url='http://gitlab.com/procps-ng/procps/'
license=('GPL' 'LGPL')
arch=('i686' 'x86_64')
depends=('ncurses' 'systemd')
makedepends=('git' 'm4' 'autoconf' 'libtool')
source=()
sha256sums=()
_gitroot="https://gitlab.com/procps-ng/procps.git"
_gitname="procps-ng"

groups=('base')

conflicts=('procps' 'sysvinit-tools' 'procps-ng')
provides=('procps' 'sysvinit-tools' 'procps-ng')
replaces=('procps' 'sysvinit-tools')

install=install

prepare() {
cd ${srcdir}
  msg "Downloading from upstream git ...."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot} ${_gitname}
    cd ${_gitname}
  fi
}

build() {
  cd "${srcdir}/${_gitname}"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --exec-prefix=/ \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --disable-kill \

  make
}

package() {
  cd "${srcdir}/${_gitname}"
  msg PKGDIR=${pkgdir}
  make DESTDIR="${pkgdir}" install

}
