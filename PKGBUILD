# Maintainer: Mario Rodas <marsam@users.noreply.github.com>

pkgname=cloudfuse-git
_gitname=cloudfuse
pkgver=r145.d212b8c
pkgrel=1
pkgdesc="Filesystem (fuse) implemented on Mosso's Cloud Files"
arch=('i686' 'x86_64')
url='https://redbo.github.io/cloudfuse/'
license=('MIT')
depends=('curl' 'fuse' 'json-c' 'libxml2')
makedepends=()
provides=('cloudfuse')
source=("$_gitname::git+https://github.com/redbo/cloudfuse.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  ./configure --prefix=/usr
  make ${MAKEFLAGS}
}

package () {
  cd "$srcdir/$_gitname"
  make DESTDIR=${pkgdir} install
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
