# Maintainer:  dacoit <dacoit at tuta.io>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Dmitry Korzhevin <dkorzhevin AT gmail DOT com>
# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: tigrmesh <tigrmesh at aol dot com>
# Contributor: Tim Zebulla <amon at faumrahrer dot de>

pkgname=weechat-git
pkgver=1.3.rc1.20.g6b75516
epoch=1
pkgver(){
    cd $pkgname
    git describe --tags --long |sed 's/-/./g;s/^v//'
}
pkgrel=1
pkgdesc="Fast, light & extensible IRC client (curses UI)"
arch=('i686' 'x86_64')
url="http://www.weechat.org/"
license=('GPL3')
depends=('gnutls' 'ncurses' 'libgcrypt')
makedepends=('git' 'cmake' 'pkgconfig' 'perl' 'python2' 'lua' 'tcl' 'ruby' 'aspell')
optdepends=('perl' 'python2' 'lua' 'tcl' 'ruby' 'aspell')
provides=('weechat')
conflicts=('weechat')
options=(!libtool)

source=("$pkgname::git://github.com/weechat/weechat.git")
md5sums=('SKIP')

build() {
  cd $pkgname
  cmake -DPREFIX=/usr \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so
  make
}

package() {
  make -C "$pkgname" DESTDIR="${pkgdir}/" install
}
