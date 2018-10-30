# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=dgedit
pkgname=$_pkgname-git
pkgver=0.r70.6dcbe41
pkgrel=1
pkgdesc="The DrumGizmo drumkit editor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.drumgizmo.org/wiki/doku.php?id=getting_dgedit"
license=('GPL')
depends=('qt5-base' 'libao' 'libsndfile')
makedepends=('git' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+http://git.drumgizmo.org/dgedit.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install

  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
