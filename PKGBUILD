# Maintainer: Jat <chat@jat.email>

_pkgname='xorgxrdp'
pkgname="$_pkgname-git"
pkgver='0.2.18.r41.ga07c9c8'
pkgrel='1'
pkgdesc='Xorg drivers for xrdp. Git version, devel branch.'
arch=('i686' 'x86_64')
url='https://github.com/neutrinolabs/xorgxrdp'
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('nasm' 'xorg-server-devel' 'xrdp')
options=('staticlibs')
source=("git+$url#branch=devel")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([0-9]*-g),r\1,;s,-,.,g'
}

build() {
  cd "$srcdir/$_pkgname"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
  install -Dm644 'COPYING' -t "$pkgdir/usr/share/licenses/$_pkgname"
}
