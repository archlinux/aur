# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=alac
pkgname=$_pkgname-git
pkgver=0.r25.5d6d836
pkgrel=1
pkgdesc="a lossless audio codec developed by Apple and deployed on all of its platforms and devices"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/mikebrady/alac"
license=('custom')
makedepends=('git')
provides=("$_pkgname" "$_pkgname-svn" 'alacconvert' 'libalac')
conflicts=("$_pkgname" "$_pkgname-svn" 'alacconvert' 'libalac')
source=("$_pkgname::git+https://github.com/mikebrady/alac.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"
  DESTDIR=$pkgdir make install
}

# vim:set ts=2 sw=2 et:
