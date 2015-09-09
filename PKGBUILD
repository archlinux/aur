# Maintainer: Thermi <noel at familie dash kuntze dot de>

pkgname=mbox-git
pkgver=0.0.274.a131424
pkgrel=1
pkgdesc="A sandbox for non-root users (git version)"
arch=('x86_64')
url="http://pdos.csail.mit.edu/mbox"
license=(MIT)
depends=(openssl)
makedepends=(git)
source=("mbox-git::git+https://github.com/tsgates/mbox")
md5sums=(SKIP)

pkgver() {
  # No release tags as of now, use 0.0
  cd "$srcdir/mbox-git"
  local count="$(git rev-list --count --full-history master)"
  local rev="$(git rev-parse --short master)"
  echo "0.0.$count.$rev"
}

build() {
  cd "$srcdir/mbox-git/src"

  cp {.,}configsbox.h
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/mbox-git/src"

  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
