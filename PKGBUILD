# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=artefetcher-qt4
pkgname=$_pkgname-git
pkgver=0.5.3.r1.gc5e6dad
pkgrel=1
pkgdesc="a tool to fetch videos from Arte TV channel"
arch=('i686' 'x86_64')
url="http://artefetcher.sourceforge.net/"
license=('GPL')
depends=('qt4')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$pkgname.install
source=("$_pkgname::git+git://git.code.sf.net/p/artefetcher/code")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/arteFetcher-//g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  lrelease-qt4 *.ts
  qmake-qt4 PREFIX="$pkgdir/usr/bin"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "arteFetcher.desktop" "$pkgdir/usr/share/applications/arteFetcher.desktop"
  install -Dm644 "img/arteFetcher.png" "$pkgdir/usr/share/pixmaps/arteFetcher.png"
}

# vim:set ts=2 sw=2 et:
