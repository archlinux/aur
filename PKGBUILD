# Maintainer:  dacoit <dacoit at tuta.io>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Dmitry Korzhevin <dkorzhevin AT gmail DOT com>
# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: tigrmesh <tigrmesh at aol dot com>
# Contributor: Tim Zebulla <amon at faumrahrer dot de>

pkgname=weechat-git
pkgver=1.3.5.gd0b11ec
pkgver(){
    cd $pkgname
    git describe --tags --long | sed 's/-/./g;s/^v//'
}
pkgrel=1
pkgdesc="Fast, light & extensible IRC client (ncurses UI)"
arch=('i686' 'x86_64')
url="http://www.weechat.org/"
license=('GPL')
depends=('gnutls' 'curl' 'libgcrypt')
makedepends=('git' 'cmake' 'pkgconfig' 'perl' 'python2' 'lua' 'tcl' 'ruby' 'aspell')
optdepends=('perl' 'python2' 'lua' 'tcl' 'ruby' 'aspell' 'guile')
provides=('weechat')
conflicts=('weechat')

source=("$pkgname::git://github.com/weechat/weechat.git")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_MAN=ON \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
