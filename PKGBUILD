# $Id$
# Maintainer : Christian Duerr <contact@christianduerr.com>
# Original PKGBUILD by
# - Christian Rebischke <Chris.Rebischke@archlinux.org>
# - Giovanni Scafora <giovanni@archlinux.org>
# - lucke <lucke at o2 dot pl>

pkgname=weechat-python3-git
pkgver=2.5.rc1.1.g403555d1b
pkgrel=1
pkgdesc="Weechat compiled with Python3 instead of Python2, experimental"
arch=('i686' 'x86_64')
url="https://github.com/weechat/weechat"
license=('GPL')
depends=('gnutls' 'curl' 'libgcrypt')
makedepends=('git' 'cmake' 'perl' 'python3')
optdepends=('perl' 'python3')
conflicts=("weechat")
source=("git+$url")
sha512sums=('SKIP')

_gitname='weechat'

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --tags | sed 's/-/./g' | tail -c +2
}

build() {
  cd "$_gitname"
  cmake -Wno-dev "$srcdir/$_gitname" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DENABLE_ASPELL=OFF \
        -DENABLE_MAN=ON \
        -DENABLE_GUILE=OFF \
        -DENABLE_JAVASCRIPT=OFF \
        -DENABLE_LUA=OFF \
        -DENABLE_PHP=OFF \
        -DENABLE_RUBY=OFF \
        -DENABLE_TCL=OFF \
        -DENABLE_PYTHON3=ON
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="${pkgdir}" install
}
