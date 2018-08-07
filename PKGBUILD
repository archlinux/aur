# $Id$
# Maintainer : Christian Duerr <contact@christianduerr.com>
# Original PKGBUILD by
# - Christian Rebischke <Chris.Rebischke@archlinux.org>
# - Giovanni Scafora <giovanni@archlinux.org>
# - lucke <lucke at o2 dot pl>

pkgname=weechat-python3-git
pkgver=2.2.17.g6140aac57
pkgrel=1
pkgdesc="Weechat compiled with Python3 instead of Python2, experimental"
arch=('i686' 'x86_64')
url="https://github.com/weechat/weechat"
license=('GPL')
depends=('gnutls' 'curl' 'libgcrypt')
makedepends=('git' 'cmake' 'perl' 'python3' 'lua' 'tcl' 'ruby' 'aspell' 'guile2.0' 'asciidoctor')
optdepends=('perl' 'python3' 'lua' 'tcl' 'ruby' 'aspell' 'guile2.0')
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
        -DENABLE_MAN=ON \
        -DENABLE_DOC=ON \
        -DENABLE_PYTHON3=ON
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="${pkgdir}" install
}
