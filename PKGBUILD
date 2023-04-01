# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=ruby-ncurses
pkgver=1.3.1
pkgrel=15
pkgdesc='Module for interactive text console applications (ncurses)'
arch=(x86_64)
url='https://sourceforge.net/projects/ncurses-ruby.berlios/'
license=(GPL)
depends=(ruby ncurses)
source=("https://downloads.sourceforge.net/ncurses-ruby.berlios/ncurses-ruby-$pkgver.tar.bz2"
        'str2cstr.patch::https://src.fedoraproject.org/rpms/ruby-ncurses/raw/main/f/0001-STR2CSTR-deprecated.patch')
sha256sums=('dca8ce452e989ce1399cb683184919850f2baf79e6af9d16a7eed6a9ab776ec5'
            '3a9fea87a0fa3eac58022e9e86e901601953939c15ebccede0ba64f4a011039d')

prepare() {
  cd ncurses-ruby-$pkgver

  patch -i ../str2cstr.patch
  sed -i '1s,^,#include <sys/time.h>\n,' ncurses_wrap.c
}

build()  {
  cd ncurses-ruby-$pkgver

  ruby extconf.rb --vendor
  make
}

package() {
  make -C ncurses-ruby-$pkgver includedir=/usr/include DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et:
