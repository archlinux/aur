# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=matwm2-git
_pkgname=matwm2
pkgver=0.1.2pre3.r647.g5d1c7f8
pkgrel=1
pkgdesc="A nice tiling or floating window manager"
arch=('i686' 'x86_64')
url="https://github.com/segin/${_pkgname}"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
replaces=('matwm2-svn')
depends=('libxinerama' 'libxft')
makedepends=('git')
source=("$pkgname::git+https://github.com/segin/matwm2.git"
	$_pkgname.desktop)
md5sums=('SKIP'
         '8b9993b93fe1d5337b631165db7252c9')

pkgver() {
  cd $pkgname
  git describe --tags|sed -r 's,^[^0-9]*,,;s,[-]([0-9]*-g),-r\1,;s,[-_],.,g'
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $pkgname
  make PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/xsessions/$_pkgname.desktop"
}
