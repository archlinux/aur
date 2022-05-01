# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgname='ctrtool'
pkgname="$_pkgname-git"
pkgver=r369.92a4b5f
pkgrel=1
pkgdesc="Tools for the Nintendo 3DS"
arch=('i686' 'x86_64')
url="https://github.com/3DSGuy/Project_CTR/"
license=('MIT')
depends=('gcc-libs')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgbase=ctr
source=("$_pkgbase::git+${url}")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgbase/$_pkgname"
  make deps
  make all
}

package() {
  cd "$srcdir/$_pkgbase/makerom/"
  install -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "$srcdir/$_pkgbase/$_pkgname/bin"
  install -Dm755 ctrtool "$pkgdir/usr/bin/$_pkgname"
}
