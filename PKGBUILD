# Maintainer: Jerry Jia <jerryjiahaha@gmail.com>

pkgname=procserv-git
_pkgname=procServ
pkgver=v2.8.0.r2.3330d41
pkgrel=1
pkgdesc="Wrapper to start arbitrary interactive commands in the background"
url="https://github.com/ralphlange/procServ"
license=('GPL3')
arch=('any')
makedepends=('autoconf' 'git' 'python-setuptools' 'dblatex')
depends=("autoconf" "asciidoc" "fop")
source=("git+https://github.com/ralphlange/procServ.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
# Git, tags available
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/$_pkgname"
    autoreconf -si
    ./configure --with-systemd-utils --enable-doc --prefix=/usr
}

build() {
    cd "$srcdir/$_pkgname"
    make -j1
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" install
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
